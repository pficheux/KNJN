/*
 * Linux USB driver for KNJN Dragon-E (bidir communication)
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

MODULE_AUTHOR("Pierre Ficheux <pierre.ficheux@gmail.com>");
MODULE_DESCRIPTION("KNJN Dragon USB driver (bidir communication)");
MODULE_LICENSE("GPL");

#define BUF_SIZE    256

#define VENDOR_ID   0x04b4
#define PRODUCT_ID  0x8614

struct usb_dragon_usb {
  struct usb_device *udev;
  int reply; // sent by Dragon
};

// Forward declaration 
static struct usb_driver dragon_usb_driver;

/* Table of devices that work with this driver */
static struct usb_device_id id_table [] = {
  { USB_DEVICE(VENDOR_ID, PRODUCT_ID) },
  {}
};
MODULE_DEVICE_TABLE (usb, id_table);

// Send msg + get reply
int dragon_get_reply (struct usb_dragon_usb *mydev)
{
  int ret = 0, l;
  unsigned char buf[5];

  memset (buf, 0, sizeof(buf));

  // Send 5 bytes to EP 2
  ret = usb_interrupt_msg  (mydev->udev, usb_sndbulkpipe(mydev->udev, 2), buf, sizeof(buf), &l, 2 * HZ);
  if (ret < 0)
    printk (KERN_WARNING "dragon_set_ledmask: usb_bulk_msg() error %d\n", ret);

  // Get answer from EP 5, board should add 5 each time driver is used
  ret = usb_interrupt_msg  (mydev->udev, usb_rcvbulkpipe(mydev->udev, 6), buf, sizeof(buf), &l, 2 * HZ);
  if (ret < 0)
    printk (KERN_WARNING "dragon_set_ledmask: usb_bulk_msg() error %d\n", ret);

  printk ("reply= %d\n", buf[0]);
  mydev->reply = buf[0];

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

static ssize_t dragon_usb_read(struct file *file, char *buf, size_t count, loff_t *ppos)
{
  struct usb_dragon_usb *mydev;
  char tmp[BUF_SIZE];
  size_t len;
  int ret;

  // 1 read is enough...for all of us :)
  if (*ppos)
    return 0;

  memset ((void*)tmp, 0, sizeof(tmp));

  /* get the dev object */
  mydev = file->private_data;
  if (mydev == NULL)
    return -ENODEV;

  // Send msg and get reply
  if ((ret = dragon_get_reply (mydev)) < 0)
    return ret;

  len = sprintf (tmp, "%d\n", mydev->reply);

  if (copy_to_user (buf, tmp, len))
    return -EFAULT;

  *ppos += len;

  return len;
}

static struct file_operations dragon_usb_file_operations = {
  .open = dragon_usb_open,
  .release = dragon_usb_release,
  .read = dragon_usb_read
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
show_reply (struct device *dev, struct device_attribute *attr,
	    char *buf)
{
  struct usb_interface *interface;
  struct usb_dragon_usb *mydev;

  interface = to_usb_interface (dev);
  mydev = usb_get_intfdata (interface);

  dragon_get_reply (mydev);

  return sprintf (buf, "0x%x\n",  mydev->reply);
}

/*
** This function will be called when sys entry is written.
*/
static ssize_t
set_reply (struct device *dev, struct device_attribute *attr,
	   const char *buf, size_t count)
{
  return count;
}

// This macro generates a struct device_attribute
static DEVICE_ATTR (reply, S_IRUGO | S_IWUGO, show_reply, set_reply);

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
  dragon_usb_dev->reply = 0;
  usb_set_intfdata (interface, dragon_usb_dev);

  // Create /sys entry
  ret = device_create_file (&interface->dev, &dev_attr_reply);
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
  device_remove_file (&interface->dev, &dev_attr_reply);
  
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
