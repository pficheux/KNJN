/*
 * Linux USBnet driver for KNJN Dragon PCI
 *
 * Pierre Ficheux (pierre.ficheux@gmail.com)
 *
 * inspired by drivers/net/usb/int51x1.c
 *
 * 9/2011
 */
#include <linux/module.h>
#include <linux/init.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/ethtool.h>
#include <linux/workqueue.h>
#include <linux/mii.h>
#include <linux/usb.h>
#include <linux/usb/usbnet.h>
#include <linux/gfp.h>


MODULE_AUTHOR("Pierre Ficheux");
MODULE_DESCRIPTION("USBnet driver for DragonPCI");
MODULE_LICENSE("GPL");

// Dragon
#define VENDOR_ID   0x0547
#define PRODUCT_ID  0x2131

static int dragon_usbnet_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
{
  printk (KERN_INFO "%s\n", __FUNCTION__);

  return 0;
}

static struct sk_buff *
dragon_usbnet_tx_fixup(struct usbnet *dev, struct sk_buff *skb, gfp_t flags)
{
  static int cnt = 0;
  unsigned int *packet = (unsigned int *)skb->data;

  printk (KERN_INFO "%s: %d len= %d packet= %08X %08X ... %08X %08X ...\n", __FUNCTION__, cnt++, skb->len, packet[0], packet[1], packet[10], packet[11]);

  return skb;
}

static const struct net_device_ops dragon_usbnet_netdev_ops = {
  .ndo_open		= usbnet_open,
  .ndo_stop		= usbnet_stop,
  .ndo_start_xmit	= usbnet_start_xmit,
  .ndo_tx_timeout	= usbnet_tx_timeout,
  .ndo_change_mtu	= usbnet_change_mtu,
  .ndo_set_mac_address	= eth_mac_addr,
  .ndo_validate_addr	= eth_validate_addr,
};

static int dragon_usbnet_bind(struct usbnet *dev, struct usb_interface *intf)
{
 int status;
 
 printk (KERN_INFO "%s\n", __FUNCTION__);

 // Should work later...
 status = usbnet_get_ethernet_addr(dev, 3);
 if (status)
   printk (KERN_WARNING "%s: usbnet_get_ethernet_addr error (%d)\n", __FUNCTION__, status);

 dev->net->netdev_ops = &dragon_usbnet_netdev_ops;
 
 status = usbnet_get_endpoints(dev, intf);
 if (status)
   printk (KERN_WARNING "%s: usbnet_get_endpoints error (%d)\n", __FUNCTION__, status);

 // always return 0 right now */
 return 0;
}

static const struct driver_info	dragon_usbnet_info = {
	.description =	"KNJN DragonPCI",
	.flags =	FLAG_ETHER,
	.bind =		dragon_usbnet_bind,
	.rx_fixup =	dragon_usbnet_rx_fixup,
	.tx_fixup =	dragon_usbnet_tx_fixup,
	.in = 1,       // IN endpoint
	.out = 2,      // OUT endpoint
};

static const struct usb_device_id	products [] = {
{
  USB_DEVICE(VENDOR_ID, PRODUCT_ID),	// DragonPCI with Cypress
  .driver_info =	(unsigned long) &dragon_usbnet_info,
},
{ },		// END
};
MODULE_DEVICE_TABLE(usb, products);

static struct usb_driver dragon_usbnet_driver = {
  .name =	"dragon_usbnet",
  .id_table =	products,
  .probe =	usbnet_probe,
  .disconnect =	usbnet_disconnect,
  .suspend =	usbnet_suspend,
  .resume =	usbnet_resume,
};

static int __init usbnet_init(void)
{
  return usb_register(&dragon_usbnet_driver);
}


static void __exit usbnet_exit(void)
{
  usb_deregister(&dragon_usbnet_driver);
}

module_init(usbnet_init);
module_exit(usbnet_exit);

