/*
 * Linux driver for KNJN Dragon PCI-L (IORESOURCE_MEM/BAR0)
 *
 *   Copyright (C) 2015-2021 Pierre Ficheux (pierre.ficheux@gmail.com)
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
 *
 */
#include <linux/kernel.h>	/* printk() */
#include <linux/module.h>	/* modules */
#include <linux/init.h>		/* module_{init,exit}() */
#include <linux/slab.h>		/* kmalloc()/kfree() */
#include <linux/pci.h>		/* pci_*() */
#include <linux/pci_ids.h>	/* pci idents */
#include <linux/list.h>		/* list_*() */
#include <asm/uaccess.h>	/* copy_{from,to}_user() */
#include <linux/fs.h>		/* file_operations */
#include <linux/interrupt.h>	/* request_irq etc */
#include <linux/version.h>
#include <linux/device.h>	/* class */

MODULE_DESCRIPTION("dragon_pci_mem");
MODULE_AUTHOR("Pierre Ficheux");
MODULE_LICENSE("GPL");

/*
 * Arguments
 */
static int major = 0; /* Major number */
module_param(major, int, 0660);
MODULE_PARM_DESC(major, "Static major number (none = dynamic)");

static int debug = 0; 
module_param(debug, int, 0660);
MODULE_PARM_DESC(debug, "Debug flag (1 = YES, 0 = NO)");

// Driver class in /sys
static struct class *pcidemo_class;

/*
 * Supported devices
 */

#define XILINX_ID    0x10ee
#define DEVICE_ID    0x0100

#define BAR0         0

static struct pci_device_id dragon_pci_mem_id_table[] = {
  {XILINX_ID, DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  {0,}	/* 0 terminated list */
};
MODULE_DEVICE_TABLE(pci, dragon_pci_mem_id_table);

/*
 * Global variables
 */
static LIST_HEAD(dragon_pci_mem_list);

struct dragon_pci_mem_struct {
  struct list_head	link; /* Double linked list */
  struct pci_dev	*dev; /* PCI device */
  int			minor; /* Minor number */
  unsigned int		*mmio;
  u32			mmio_len;
};

// Works with updated design PCIe design
#define USE_IRQ

#ifdef USE_IRQ
/*
 * Event handler
 */
irqreturn_t dragon_pci_mem_irq_handler(int irq, void *dev_id)
{
  struct dragon_pci_mem_struct *data = (struct dragon_pci_mem_struct *)dev_id;

  if (debug)
    printk(KERN_INFO "dragon_pci_mem: interrupt from device %d\n", data->minor);

  return IRQ_HANDLED;
}
#endif

/*
 * File operations
 */
static ssize_t dragon_pci_mem_read(struct file *file, char *buf, size_t count, loff_t *ppos)
{
  int real;
  struct dragon_pci_mem_struct *data = file->private_data;

  /* Check for overflow */
#ifdef CONFIG_X86_64
  real = min(data->mmio_len - (u64)*ppos, (u64) count);
#else
  real = min(data->mmio_len - (u32)*ppos, (u32) count);
#endif

  /* Copy data from board */
  if (real)
    if (copy_to_user((void __user *)buf, (void *)data->mmio + (int)*ppos, real))
      return -EFAULT;

  *ppos += real;

  return real;
}

static ssize_t dragon_pci_mem_write(struct file *file, const char *buf, size_t count, loff_t *ppos)
{
  int i, data_to_write, real;
  struct dragon_pci_mem_struct *data = file->private_data;
  
  /* Check for overflow */
#ifdef CONFIG_X86_64
  real = min(data->mmio_len - (u64)*ppos, (u64) count);
#else
  real = min(data->mmio_len - (u32)*ppos, (u32) count);
#endif

  // Led control -> just send mask from 0 to 3
  data_to_write = buf[0];
  iowrite32(data_to_write, data->mmio);

  if (debug) {
    for (i = 0 ; i < sizeof(int) ; i++)
      pr_info ("%s buf[%d] = %x\n", __FUNCTION__, i, buf[i]);
  }

  *ppos += real;

  return real;
}

static int dragon_pci_mem_open(struct inode *inode, struct file *file)
{
  int minor = MINOR(inode->i_rdev);
  struct list_head *cur;
  struct dragon_pci_mem_struct *data;

  if (debug)
    printk("dragon_pci_mem_open()\n");

  list_for_each(cur, &dragon_pci_mem_list) {
    data = list_entry(cur, struct dragon_pci_mem_struct, link);

    if (data->minor == minor) {
      file->private_data = data;

      return 0;
    }
  }

  printk(KERN_WARNING "dragon_pci_mem: minor %d not found\n", minor);

  return -ENODEV;
}

static int dragon_pci_mem_release(struct inode *inode, struct file *file)
{
  if (debug)
    printk("dragon_pci_mem_release()\n");

  file->private_data = NULL;

  return 0;
}

static struct file_operations dragon_pci_mem_fops = {
  .owner =	THIS_MODULE,
  .read =	dragon_pci_mem_read,
  .write =	dragon_pci_mem_write,
  .open =	dragon_pci_mem_open,
  .release =	dragon_pci_mem_release,
};

/*
 * PCI handling
 */
static int dragon_pci_mem_probe(struct pci_dev *dev, const struct pci_device_id *ent)
{
  int ret = 0;
  struct dragon_pci_mem_struct *data;
  static int minor = 0;
  struct device *device = NULL;

  printk(KERN_INFO "dragon_pci_mem: found %04x:%04x\n", ent->vendor, ent->device);
  printk(KERN_INFO "dragon_pci_mem: using major %d and minor %d for this device\n", major, minor);

  /* Allocate a private structure and reference it as driver's data */
  data = (struct dragon_pci_mem_struct *)kmalloc(sizeof(struct dragon_pci_mem_struct), GFP_KERNEL);
  if (data == NULL) {
    printk(KERN_WARNING "dragon_pci_mem: unable to allocate private structure\n");

    ret = -ENOMEM;
    goto cleanup_kmalloc;
  }

  pci_set_drvdata(dev, data);

  /* Init private field */
  data->dev = dev;
  data->minor = minor++;

  /* Initialize device before it's used by the driver */
  ret = pci_enable_device(dev);
  if (ret < 0) {
    printk(KERN_WARNING "dragon_pci_mem: unable to initialize PCI device\n");

    goto cleanup_pci_enable;
  }

  /* Reserve PCI I/O and memory resources */
  ret = pci_request_regions(dev, "dragon_pci_mem");
  if (ret < 0) {
    printk(KERN_WARNING "dragon_pci_mem: unable to reserve PCI resources\n");

    goto cleanup_regions;
  }

  /* Remap BAR0 */
  data->mmio = pci_iomap(dev, BAR0, pci_resource_len(dev, BAR0));
  if (data->mmio == NULL) {
    printk(KERN_WARNING "dragon_pci_mem: unable to remap BAR0\n");
    goto cleanup_pci_iomap;
  }

  data->mmio_len = pci_resource_len(dev, BAR0);

  printk(KERN_INFO "dragon_pci_mem: BAR0 has been remaped at 0x%p\n", data->mmio);

  /* Install the irq handler */
#ifdef USE_IRQ
  if (dev->pin) {
    if (pci_enable_msi (dev))
      printk(KERN_WARNING "dragon_pci_mem: unable to init MSI !\n");
    else 
      ret = request_irq(dev->irq, dragon_pci_mem_irq_handler, 0, "dragon_pci_mem", data);
    if (ret < 0) {
      printk(KERN_WARNING "dragon_pci_mem: unable to register irq handler\n");
      goto cleanup_irq;
    }
    else
      printk(KERN_WARNING "dragon_pci_mem: IRQ %d registered !\n", dev->irq);
  }
  else
    printk(KERN_INFO "dragon_pci_mem: no IRQ!\n");
#endif

  /* Link the new data structure with others */
  list_add_tail(&data->link, &dragon_pci_mem_list);

  // add device to class
  device = device_create(pcidemo_class, NULL, MKDEV(major, data->minor), NULL, "dragon_pci_mem" "%d", data->minor);

  if (IS_ERR(device)) {
    ret = PTR_ERR(device);
    printk(KERN_WARNING "dragon_pci_mem: can't create device %d\n", data->minor);
    goto cleanup_irq;
  }

  return 0;

cleanup_irq:
  pci_iounmap(dev, data->mmio);
cleanup_pci_iomap:
  pci_release_regions(dev);
cleanup_regions:
  pci_disable_device(dev);
cleanup_pci_enable:
  kfree(data);
cleanup_kmalloc:
  return ret;
}

static void dragon_pci_mem_remove(struct pci_dev *dev)
{
  struct dragon_pci_mem_struct *data = pci_get_drvdata(dev);

  // Unmap BAR0
  pci_iounmap(dev, data->mmio);

  pci_release_regions(dev);

#ifdef USE_IRQ
  if (dev->pin) {
    free_irq(dev->irq, data);
    pci_disable_msi(dev);
  }
#endif
  pci_disable_device(dev);

  list_del(&data->link);

  device_destroy(pcidemo_class, MKDEV(major, data->minor));

  kfree(data);

  printk(KERN_INFO "dragon_pci_mem: device removed\n");
}

static struct pci_driver dragon_pci_mem_driver = {
  .name =	"dragon_pci_mem",
  .id_table =	dragon_pci_mem_id_table,
  .probe =	dragon_pci_mem_probe,		/* Init one device */
  .remove =	dragon_pci_mem_remove,		/* Remove one device */
};

/*
 * Init and Exit
 */
static int __init dragon_pci_mem_init(void)
{
  int ret;

  /* Register the device driver major */
  ret = register_chrdev(major, "dragon_pci_mem", &dragon_pci_mem_fops);
  if (ret < 0) {
    printk(KERN_WARNING "dragon_pci_mem: unable to get a major\n");

    return ret;
  }

  if (major == 0)
    major = ret; /* dynamic value */

  // Class creation in /sys/class
  pcidemo_class = class_create (THIS_MODULE, "pcidemo");
  if (IS_ERR(pcidemo_class)) {
    ret = PTR_ERR(pcidemo_class);
    printk(KERN_WARNING "dragon_pci_mem: can't create class !\n");

    return ret;
  }

  /* Register PCI driver */
  ret = pci_register_driver(&dragon_pci_mem_driver);
  if (ret < 0) {
    printk(KERN_WARNING "dragon_pci_mem: unable to register PCI driver\n");

    unregister_chrdev(major, "dragon_pci_mem");

    return ret;
  }

  return 0;
}

static void __exit dragon_pci_mem_exit(void)
{
  pci_unregister_driver(&dragon_pci_mem_driver);
  class_destroy(pcidemo_class);
  unregister_chrdev(major, "dragon_pci_mem");
}

/*
 * Module entry points
 */
module_init(dragon_pci_mem_init);
module_exit(dragon_pci_mem_exit);
