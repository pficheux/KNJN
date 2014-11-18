/*
 * Linux USB driver for KNJN Dragon-E (leds + text LCD)
 *
 *   Copyright (C) 2011-2014 Pierre Ficheux (pierre.ficheux@gmail.com)
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
#include <asm/uaccess.h>

MODULE_AUTHOR("Pierre Ficheux <pierre.ficheux@gmail.com>");
MODULE_DESCRIPTION("KNJN Dragon USB driver (leds + text LCD)");
MODULE_LICENSE("GPL");

#define BUF_SIZE    256

#define VENDOR_ID   0x04b4
#define PRODUCT_ID  0x8614

struct usb_dragon_usb {
  struct usb_device *udev;
  int ledmask; // we can send up to 32 bits
};

// Forward declaration 
static struct usb_driver dragon_usb_driver;

/* Table of devices that work with this driver */
static struct usb_device_id id_table [] = {
  { USB_DEVICE(VENDOR_ID, PRODUCT_ID) },
  {}
};
MODULE_DEVICE_TABLE (usb, id_table);

// Send Bulk msg to set led mask
int dragon_set_ledmask (struct usb_dragon_usb *mydev, const char *buf)
{
  int ret = 0, l, n;
  char c;

  // Remove \n if any
  l = strlen(buf);
  l = (*(buf+l-1) == '\n' ? l-1 : l);

  // Get value from buf
  if (*buf == '\'') {
    // 'a => 0x61
    sscanf (buf+1, "%c", &c);
    mydev->ledmask = c;
    l--;
  }
  else
    sscanf (buf, "%x", &(mydev->ledmask));

  // Handle x instead of 0x
  n = (l >= 2 ? l/2 : l);

  // Send bulk message
  ret = usb_bulk_msg  (mydev->udev, usb_sndbulkpipe(mydev->udev, 2), &(mydev->ledmask), n, &l, 2 * HZ);
  if (ret < 0)
    printk (KERN_WARNING "dragon_set_ledmask: usb_bulk_msg() error %d\n", ret);

  return ret;
}

//
// char device functions
//
static int dragon_usb_open (struct inode *inode, struct file *file)
{
  struct usb_dragon_usb *dev;
  struct usb_interface *interface;
  int minor;
  
  minor = iminor(inode);

  // Get interface for device
  interface = usb_find_interface (&dragon_usb_driver, minor);
  if (!interface)
    return -ENODEV;

  // Get private data from interface
  dev = usb_get_intfdata (interface);
  if (dev == NULL) {
      printk (KERN_WARNING "dragon_usb_open(): can't find device for minor %d\n", minor);
      return -ENODEV;
  }

  // Set to file structure
  file->private_data = (void *)dev;

  return 0;
}

static int dragon_usb_release (struct inode *inode, struct file *file)
{
  return 0;
}

static ssize_t dragon_usb_write(struct file *file, const char *buf, size_t count, loff_t *ppos)
{
  struct usb_dragon_usb *mydev;
  char tmp[BUF_SIZE];
  int real, ret;

  memset ((void*)tmp, 0, sizeof(tmp));

  /* get the dev object */
  mydev = file->private_data;
  if (mydev == NULL)
    return -ENODEV;

  real = min((size_t)BUF_SIZE, count);

  if (real)
    if (copy_from_user(tmp, buf, real))
      return -EFAULT;

  // Now set the ledmask value
  if ((ret = dragon_set_ledmask (mydev, tmp)) < 0)
    return ret;
  else
    return real;
}


static struct file_operations dragon_usb_file_operations = {
  .open = dragon_usb_open,
  .release = dragon_usb_release,
  .write = dragon_usb_write
};

static struct usb_class_driver dragon_usb_class_driver = {
  .name = "usb/dragon_usb%d",
  .fops = &dragon_usb_file_operations,
  .minor_base = 0
};


/*
** This function will be called when sys entry is read.
*/
static ssize_t
show_ledmask (struct device *dev, struct device_attribute *attr,
	    char *buf)
{
  struct usb_interface *interface;
  struct usb_dragon_usb *mydev;

  interface = to_usb_interface (dev);
  mydev = usb_get_intfdata (interface);

  return sprintf (buf, "0x%x\n",  mydev->ledmask);
}

/*
** This function will be called when sys entry is written.
*/
static ssize_t
set_ledmask (struct device *dev, struct device_attribute *attr,
	   const char *buf, size_t count)
{
  struct usb_interface *interface;
  struct usb_dragon_usb *mydev;
  int ret;

  interface = to_usb_interface (dev);
  mydev = usb_get_intfdata (interface);

  // Now set the ledmask value
  if ((ret = dragon_set_ledmask (mydev, buf)) < 0)
    return ret;
  else
    return count;
}

// This macro generates a struct device_attribute
static DEVICE_ATTR (ledmask, S_IRUGO | S_IWUGO, show_ledmask, set_ledmask);


static int dragon_usb_probe (struct usb_interface *interface, const struct usb_device_id *id)
{
  struct usb_device *udev = interface_to_usbdev (interface);
  struct usb_dragon_usb *dragon_usb_dev;
  int ret;

  ret = usb_register_dev(interface, &dragon_usb_class_driver);
  if (ret < 0) {
    printk (KERN_WARNING "dragon_usb_probe: usb_register_dev() error\n");
    return ret;
  }

  dragon_usb_dev = kmalloc (sizeof(struct usb_dragon_usb), GFP_KERNEL);
  if (dragon_usb_dev == NULL) {
    dev_err (&interface->dev, "Out of memory\n");
    return -ENOMEM;
  }

  // Fill private structure and save it
  memset (dragon_usb_dev, 0, sizeof (*dragon_usb_dev));
  dragon_usb_dev->udev = usb_get_dev(udev);
  dragon_usb_dev->ledmask = 0;
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
  usb_deregister_dev(interface, &dragon_usb_class_driver);
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
    printk (KERN_WARNING "usb_register failed. Error number %d", retval);
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
