/*
 * RTDM driver for KNJN Dragon PCI (PCI_PnP.100K.bit, IORESOURCE_IO)
 *
 * Pierre Ficheux (pierre.ficheux@openwide.fr) + EPITA students
 *
 * 7/2011
 */

#include <linux/module.h>
#include <linux/pci.h>
#include <linux/types.h>
#include <rtdm/rtdm_driver.h>

#include "pci_io_rtdm.h"

#define RTDM_SUBCLASS_PL		0
#define PCI_LED_VID			0x0100
#define PCI_LED_DID			0x0000

MODULE_DESCRIPTION("PCI Led driver");
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Pierre Ficheux + EPITA students");

static int debug;

module_param(debug, int, 0644);

struct pci_io_context {
  int iobase; // base address
  int value;  // value to write
};

int pci_io_open(struct rtdm_dev_context *context, rtdm_user_info_t *user_info, int oflags)
{
  struct pci_io_context *ctx = (struct pci_io_context *) context->dev_private;
  struct pci_io_context *private = context->device->device_data;

  // Save to dev_private
  ctx->iobase = private->iobase; 
  ctx->value = 0;

  printk(KERN_INFO "%s: opening device %d\n", __FUNCTION__, context->device->device_id);

  return 0;
}

int pci_io_close(struct rtdm_dev_context *context, rtdm_user_info_t *user_info)
{
  return 0;
}

int pci_io_ioctl_rt(struct rtdm_dev_context *context, rtdm_user_info_t *user_info,
		unsigned int request, void __user *arg)
{
  struct pci_io_context *ctx = (struct pci_io_context *) context->dev_private;
  int val;

  switch (request) {
  
  case PCI_IO_IOCTL_READ:
    val = inl(ctx->iobase);

    if (debug)
      rtdm_printk("%s : val= %x\n", __FUNCTION__, val);

    if (rtdm_safe_copy_to_user (user_info, arg, &val, sizeof(int)))
      return -EFAULT;
    else
      return 0;
  
  case PCI_IO_IOCTL_WRITE:

    if (debug)
      rtdm_printk("%s : arg= %x\n", __FUNCTION__, (int)arg);


    outl((int)arg, ctx->iobase);
    return 0;
  
  default:
    return -EINVAL;
  }
}

static ssize_t pci_io_write_rt(struct rtdm_dev_context *context, rtdm_user_info_t * user_info, const void *buf, size_t nbyte)
{
  struct pci_io_context *ctx = (struct pci_io_context *) context->dev_private;

  if (rtdm_safe_copy_from_user(user_info, &(ctx->value), buf, sizeof(int))) {
    rtdm_printk("%s : rtdm_safe_copy_from_user\n", __FUNCTION__);
    return -EFAULT;
  }

  if (debug)
    rtdm_printk("%s : val= %x\n", __FUNCTION__, ctx->value);

  outl(ctx->value, ctx->iobase);

  return sizeof(int);
}


static struct rtdm_device pci_io_device = {
  .struct_version = RTDM_DEVICE_STRUCT_VER,

  .device_flags = RTDM_NAMED_DEVICE,
  .context_size = sizeof(struct pci_io_context),
  .device_name = "",

  .open_rt = NULL,
  .open_nrt = pci_io_open,

  .ops = {
    .close_rt = NULL,
    .close_nrt = pci_io_close,

    .ioctl_rt = pci_io_ioctl_rt,
    .ioctl_nrt = NULL,

    .read_rt = NULL,
    .read_nrt = NULL,

    .write_rt = pci_io_write_rt,
    .write_nrt = NULL,
  },

  .device_class = RTDM_CLASS_EXPERIMENTAL,
  .device_sub_class = RTDM_SUBCLASS_PL,
  .driver_name = "pci_io_rtdm",
  .driver_version = RTDM_DRIVER_VER(0, 0, 0),
  .peripheral_name = "PCI IO RTDM",
  .provider_name = "PF",
  .proc_name = pci_io_device.device_name,
};

//
// PCI handling
//

static int __devinit pci_io_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
{
  static int dev_number = 0;
  struct rtdm_device *rt_dev;
  struct pci_io_context *private;
  int ret, i;

  printk(KERN_INFO "%s: found %x:%x\n", __FUNCTION__, id->vendor, id->device);

  if ((ret = pci_enable_device(dev)) != 0) {
    printk(KERN_WARNING "%s: pci_enable_device failed.\n", __FUNCTION__);
    goto cleanup_pci_enable;
  }

  // Allocation RTDM device 
  if ((rt_dev = kmalloc(sizeof (struct rtdm_device), GFP_KERNEL)) == NULL) {
    printk(KERN_WARNING "%s: kmalloc failed.\n", __FUNCTION__);
    ret = -ENOMEM;
    goto cleanup_kmalloc;
  }

  // Copy struct content to allocated rt_dev
  memcpy(rt_dev, &pci_io_device, sizeof (struct rtdm_device));


  // Set device data to PCI structure
  pci_set_drvdata(dev, rt_dev);

  /* Reserve PCI I/O and memory resources */
  if ((ret = pci_request_regions(dev, "pci_io_rtdm")) != 0) {
    printk(KERN_WARNING "%s: pci_request_regions failed.\n", __FUNCTION__);
    goto cleanup_pci_regions;
  }

  // Allocate device_data in RTDM structure
  if ((rt_dev->device_data = kmalloc(sizeof (struct pci_io_context), GFP_KERNEL)) == NULL) {
    printk(KERN_WARNING "%s: kmalloc failed.\n", __FUNCTION__);
    ret = -ENOMEM;
    goto cleanup_kmalloc2;
  }

  private = rt_dev->device_data;

  // Inspect PCI BARs and search IORESOURCE_IO 
  // First IORESOURCE_IO is saved to device_data
  for (i = 0; i < DEVICE_COUNT_RESOURCE; ++i) {
    if (pci_resource_len(dev, i) == 0)
      continue;

    if (pci_resource_start(dev, i) == 0)
      continue;

    if (pci_resource_flags(dev, i) & IORESOURCE_IO) {
      printk(KERN_INFO "%s: IO resource base address : %x\n", __FUNCTION__, pci_resource_start(dev, i));
      private->iobase = pci_resource_start(dev, i);
      break;
    }
  }

  // No IORESOURCE_IO found
  if (i == DEVICE_COUNT_RESOURCE)
    printk(KERN_WARNING "%s: No IORESOURCE_IO found\n", __FUNCTION__);

  // Device name + /proc name
  snprintf(rt_dev->device_name, RTDM_MAX_DEVNAME_LEN, "pci_io%d", dev_number);
  rt_dev->proc_name = rt_dev->device_name;
  rt_dev->device_id = dev_number++;

  // Register RTDM device
  if ((ret = rtdm_dev_register(rt_dev)) != 0) {
    printk(KERN_WARNING "%s: rtdm_dev_register failed.\n", __FUNCTION__);
    goto cleanup_dev_register;
  }


  return 0;

 cleanup_dev_register:
  kfree(rt_dev->device_data);
 cleanup_kmalloc2:
  pci_release_regions(dev);
 cleanup_pci_regions:
  rtdm_dev_unregister(rt_dev, 1000);
  kfree(rt_dev);
 cleanup_kmalloc:
  pci_disable_device(dev);
 cleanup_pci_enable:

  return ret;
}

static void __devexit pci_io_pci_remove(struct pci_dev *dev)
{
  struct rtdm_device *rt_dev = pci_get_drvdata(dev);

  printk(KERN_INFO "%s started\n", __FUNCTION__);

  kfree(rt_dev->device_data);
	
  rtdm_dev_unregister(rt_dev, /* delay = */ 1000);

  kfree(rt_dev);

  pci_release_regions(dev);
  pci_disable_device(dev);

  printk(KERN_INFO "%s: device removed\n", __FUNCTION__);
}

// Supported devices
static struct pci_device_id pci_io_ids[] = {
  { PCI_DEVICE(PCI_LED_VID, PCI_LED_DID) },
  { 0, },
};
MODULE_DEVICE_TABLE(pci, pci_io_ids);

static struct pci_driver pci_io_pci_driver = {
  .name = "pci_io_rtdm",
  .id_table = pci_io_ids,
  .probe = pci_io_pci_probe,
  .remove = __devexit_p(pci_io_pci_remove),
};

int __init pci_io_init(void)
{
  printk(KERN_INFO "PCI IO RTDM driver loading\n");

  return pci_register_driver(&pci_io_pci_driver);
}

void __exit pci_io_exit(void)
{
  printk(KERN_INFO "PCI IO RTDM driver unloading\n");

  pci_unregister_driver(&pci_io_pci_driver);
}

module_init(pci_io_init);
module_exit(pci_io_exit);
