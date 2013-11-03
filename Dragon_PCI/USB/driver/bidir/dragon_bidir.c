/*
 * Linux USB driver for KNJN Dragon (IO8 / reg_banks)
 *
 *   Copyright (C) 2011 Pierre Ficheux (pierre.ficheux@gmail.com)
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/usb.h>

MODULE_AUTHOR("Pierre Ficheux <pierre.ficheux@gmail.com>");
MODULE_DESCRIPTION("KNJN Dragon USB driver");
MODULE_LICENSE("GPL");

#define BUF_SIZE    64

#define VENDOR_ID   0x0547
#define PRODUCT_ID  0x2131

struct usb_dragon_usb {
  struct usb_device *udev;
  int init_done;
  char buffer[BUF_SIZE];
};


// Forward declaration 
static struct usb_driver dragon_usb_driver;

/* Table of devices that work with this driver */
static struct usb_device_id id_table [] = {
  { USB_DEVICE(VENDOR_ID, PRODUCT_ID) },
  {}
};
MODULE_DEVICE_TABLE (usb, id_table);



/*
** This function will be called when sys entry is read.
*/
static ssize_t
show_ledmask (struct device *dev, struct device_attribute *attr,
	    char *buf)
{
  struct usb_interface *interface;
  struct usb_dragon_usb *mydev;
  int n, l, ret;
  char buf_size[2];
  
  buf_size[0] = BUF_SIZE;
  buf_size[1] = 0;
    
  interface = to_usb_interface (dev);
  mydev = usb_get_intfdata (interface);

  if (!(mydev->init_done)) {
    // Send bulk message
    ret = usb_bulk_msg  (mydev->udev, usb_sndbulkpipe(mydev->udev, 6), buf_size, 2, &l, 2 * HZ);
    if (ret < 0)
      printk (KERN_WARNING "dragon_set_ledmask: usb_bulk_msg() error %d\n", ret);
    else
      printk (KERN_WARNING "dragon_set_ledmask: usb_bulk_msg() l= %d\n", l);
    mydev->init_done = 1;
  }

  ret = usb_bulk_msg  (mydev->udev, usb_rcvbulkpipe(mydev->udev, 4), mydev->buffer, 64, &l, 2 * HZ);
  if (ret < 0)
    printk (KERN_WARNING "dragon_set_ledmask: usb_bulk_msg() error %d\n", ret);
  else
    printk (KERN_WARNING "dragon_set_ledmask: usb_bulk_msg() l= %d\n", l);


  return sprintf (buf, "%02x %02x\n",  mydev->buffer[0] & 255, mydev->buffer[1] & 255);
}


/*
** This function will be called when sys entry is written.
*/
static ssize_t
set_ledmask (struct device *dev, struct device_attribute *attr,
	   const char *buf, size_t count)
{
  return count;
}

// This macro generates a struct device_attribute
static DEVICE_ATTR (ledmask, S_IRUGO | S_IWUGO, show_ledmask, set_ledmask);


static int dragon_usb_probe (struct usb_interface *interface, const struct usb_device_id *id)
{
  struct usb_device *udev = interface_to_usbdev (interface);
  struct usb_dragon_usb *dragon_usb_dev;
  int ret;

   dragon_usb_dev = kmalloc (sizeof(struct usb_dragon_usb), GFP_KERNEL);
  if (dragon_usb_dev == NULL) {
    dev_err (&interface->dev, "Out of memory\n");
    return -ENOMEM;
  }

  // Fill private structure and save it
  memset (dragon_usb_dev, 0, sizeof (*dragon_usb_dev));
  dragon_usb_dev->udev = usb_get_dev(udev);
  memset (dragon_usb_dev->buffer, 0, BUF_SIZE);
  dragon_usb_dev->init_done = 0;
  usb_set_intfdata (interface, dragon_usb_dev);

  // Create /sys entry
  ret = device_create_file (&interface->dev, &dev_attr_ledmask);
  if (ret < 0) {
    printk (KERN_WARNING "dragon_usb_probe: device_create_file() error\n");
    return ret;
  }

  // Set interface to alternate 1
  ret = usb_set_interface  (udev, 0, 1);
  if (ret < 0) {
    printk (KERN_WARNING "dragon_usb_probe: usb_set_interface() error\n");
    return ret;
  }

  dev_info(&interface->dev, "KNJN Dragon now attached\n");

  return 0;
}


static void dragon_usb_disconnect(struct usb_interface *interface)
{
  struct usb_dragon_usb *dev;

  dev = usb_get_intfdata(interface);
  device_remove_file (&interface->dev, &dev_attr_ledmask);
  
  usb_set_intfdata(interface, NULL);
  kfree(dev);

  dev_info(&interface->dev, "KNJN Dragon now disconnected\n");
}

static struct usb_driver dragon_usb_driver = {
  .name = "dragon_usb",
  .probe = dragon_usb_probe,
  .disconnect = dragon_usb_disconnect,
  .id_table = id_table,
};

static int __init usb_dragon_usb_init(void)
{
  int retval = 0;

  printk(KERN_DEBUG "dragon_usb: usb_dragon_usb_init()\n");

  retval = usb_register(&dragon_usb_driver);
  if (retval) {
    err("usb_register failed. Error number %d", retval);
    return retval;
  }

  printk(KERN_DEBUG "dragon_usb: device successfully registered\n");

  return retval;
}

static void __exit usb_dragon_usb_exit(void)
{
  printk(KERN_DEBUG "dragon_usb: usb_dragon_usb_exit()\n");

  usb_deregister(&dragon_usb_driver);
}

module_init (usb_dragon_usb_init);
module_exit (usb_dragon_usb_exit);
