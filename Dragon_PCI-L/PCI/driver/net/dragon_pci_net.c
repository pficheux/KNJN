/*
 * Linux PCI/Ethernet driver for KNJN Dragon PCI-E/L
 *
 * Pierre Ficheux (pierre.ficheux@gmail.com)
 *
 * 12/2015
 *
 * Just blinks leds as receiving (ICMP) frames
 *
 */

#include <linux/kernel.h>	/* printk() */
#include <linux/module.h>	/* modules */
#include <linux/init.h>		/* module_{init,exit}() */
#include <linux/pci.h>		/* pci_*() */
#include <linux/pci_ids.h>	/* pci idents */
#include <linux/interrupt.h>	/* request_irq etc */
#include <linux/version.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/skbuff.h>


MODULE_DESCRIPTION("dragon_pci_net");
MODULE_AUTHOR("Pierre Ficheux");
MODULE_LICENSE("GPL");

static int debug = 0; 
module_param(debug, int, 0660);
MODULE_PARM_DESC(debug, "Debug flag (1 = YES, 0 = NO)");

/*
 * Supported devices
 */
#define XILINX_ID    	0x10ee

// DragonPCI-L
#define DRAGON_L_ID    	0x0100
// DragonPCI-E
#define DRAGON_E_ID   	0x0007

static struct pci_device_id dragon_pci_net_id_table[] = {
  {XILINX_ID, DRAGON_E_ID, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  {XILINX_ID, DRAGON_L_ID, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  {0,}	/* 0 terminated list */
};

MODULE_DEVICE_TABLE(pci, dragon_pci_net_id_table);

/*
 * Global variables
 */
static LIST_HEAD(dragon_pci_net_list);

// Board private structure
struct dragon_pci_net_private {
  struct pci_dev	*pci_dev;        /* PCI device */
  unsigned int		*mmio;       /* IORESOURCE_MEM BAR @ */
  u32			mmio_len;    /* IORESOURCE_MEM BAR length */
  struct net_device     *netdev;     /* Network device */
};

#define PKT_SIZE	64

/*
 * Event handler
 */
irqreturn_t dragon_pci_net_irq_handler(int irq, void *dev)
{
  struct net_device *ndev = (struct net_device *) dev;
  unsigned char data[PKT_SIZE];
  struct sk_buff *skb;
  static char *str = "KNJN boards are the best !!";
  int j;
  static int i = 14;

  if (debug)
    printk(KERN_INFO "%s: interrupt from device %s\n", __FUNCTION__, ndev->name);

  // Sender is 01:02:03:04:05:06
  for (j = 1 ; j <= 6 ; j++)
    data[j-1] = j;

  // Receiver is the board
  for (j = 0 ; j < 6 ; j++)
    data[j+6] = ndev->dev_addr[j];

  // should be something like an IP datagram
  data[12] = 0x08;
  data[13] = 0x00;

  // Copy str to payload
  memset (&data[14],  ' ', sizeof(data)-14);
  memcpy (&data[i], str, strlen(str));
  if (i + strlen(str) == PKT_SIZE)
    i = 14;
  else
    i++;

  skb = netdev_alloc_skb_ip_align(ndev, PKT_SIZE);

  if (skb) {
    skb->dev = ndev;
    // Copy data to skb
    skb_copy_to_linear_data (skb, (void *)data, sizeof(data));

    // Updata tail + len then send SKB to stack
    skb_put (skb, sizeof(data));
    skb->protocol = eth_type_trans (skb, ndev);
    netif_receive_skb (skb);
  }
  else
    printk (KERN_WARNING "%s: dev_alloc_skb error\n", __FUNCTION__);

  return IRQ_HANDLED;
}


/*************
 * Net driver
 *************/

static int dragon_pci_net_open(struct net_device *dev)
{
  int ret = 0;
  struct dragon_pci_net_private *priv = netdev_priv (dev);

  printk (KERN_INFO "%s\n", __FUNCTION__);


  // Clear BAR
  if (priv->mmio)
    memset_io (priv->mmio, 0, priv->mmio_len);

  /* Install the irq handler */
  if (priv->pci_dev->pin) {
    if (pci_enable_msi (priv->pci_dev))
      printk(KERN_WARNING "%s: unable to init MSI !\n", __FUNCTION__);
    else
      ret = request_irq(priv->pci_dev->irq, dragon_pci_net_irq_handler, IRQF_SHARED, dev->name, dev);
    if (ret < 0) {
      printk(KERN_WARNING "dragon_pci_mem: unable to register irq handler\n");
    }
  }
  else
    printk(KERN_INFO "%s: no IRQ!\n", __FUNCTION__);

  // Enable transmission for the device
  netif_start_queue(dev);

  return ret;
}

/*
 * The inverse routine to dragon_pci_net_open().
 */

static int dragon_pci_net_close(struct net_device *dev)
{
  struct dragon_pci_net_private *priv = netdev_priv (dev);

  printk (KERN_INFO "%s\n", __FUNCTION__);

  if (priv->pci_dev->pin) {
    free_irq(priv->pci_dev->irq, dev);
    pci_disable_msi(priv->pci_dev);
  }

  // Disable transmission
  netif_stop_queue(dev);

  return 0;
}

/*
 * Start sending.
 */
static int dragon_pci_net_start_xmit(struct sk_buff *skb, struct net_device *dev)
{
  struct dragon_pci_net_private *priv = netdev_priv (dev);

  if (debug)
    printk (KERN_INFO "%s: got %d bytes\n", __FUNCTION__, skb->len);

  // Copy SKB data to BAR
  if (priv->mmio)
    memcpy_toio (priv->mmio, skb->data, skb->len);
  else
    printk (KERN_INFO "%s: No available PCI BAR !\n", __FUNCTION__);

  // Free SKB
  dev_kfree_skb(skb);

  return NETDEV_TX_OK;
}

static const struct net_device_ops dragon_pci_net_netdev_ops = {
  .ndo_open		= dragon_pci_net_open,
  .ndo_stop		= dragon_pci_net_close,
  .ndo_start_xmit		= dragon_pci_net_start_xmit,
  .ndo_change_mtu		= eth_change_mtu,
  .ndo_set_mac_address 	= eth_mac_addr,
  .ndo_validate_addr	= eth_validate_addr,
};

static void dragon_pci_net_setup(struct net_device *dev)
{
  ether_setup(dev);

  /* Initialize the device structure. */
  dev->netdev_ops = &dragon_pci_net_netdev_ops;

  /* Fill in device structure with ethernet-generic values. */
  dev->flags |= IFF_NOARP;
  dev->flags &= ~IFF_MULTICAST;
  random_ether_addr(dev->dev_addr);
  dev->netdev_ops = &dragon_pci_net_netdev_ops;
}

/****************
 * PCI handling
 ****************/

static int dragon_pci_net_probe(struct pci_dev *dev, const struct pci_device_id *ent)
{
  int i, ret = 0;
  struct dragon_pci_net_private *priv;
  struct net_device *ndev = NULL;

  printk(KERN_INFO "%s: found %x:%x\n", __FUNCTION__, ent->vendor, ent->device);

  //
  // Net device init
  //
#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,17,0)
  ndev = alloc_netdev(sizeof(struct dragon_pci_net_private), "dragon%d", NET_NAME_UNKNOWN, dragon_pci_net_setup);
#else
  ndev = alloc_netdev(sizeof(struct dragon_pci_net_private), "dragon%d", dragon_pci_net_setup);
#endif
  if (!ndev) {
    printk(KERN_WARNING "%s: unable to allocate net device\n", __FUNCTION__);
    return -1;
  }

  pci_set_drvdata(dev, ndev);

  ret = dev_alloc_name(ndev, ndev->name);
  if (ret < 0) {
    printk(KERN_WARNING "%s: unable to allocate netdev name (err= %d)\n", __FUNCTION__, ret);
    free_netdev(ndev);
    return -1;
  }

  printk(KERN_INFO "%s: DragonPCI adapter, addr= %pM\n", ndev->name, ndev->dev_addr);

  ret = register_netdev(ndev);

  if (ret < 0) {
    printk(KERN_WARNING "%s: unable to register net device (err= %d)\n", __FUNCTION__, ret);
    free_netdev(ndev);
    return -1;
  }

  //
  // PCI init
  //

  /* get private data from net_device */
  priv = netdev_priv (ndev);

  /* Init private field */
  priv->pci_dev = dev;
  priv->netdev = ndev;
  priv->mmio = NULL;
  priv->mmio_len = 0;

  /* Initialize device before it's used by the driver */
  ret = pci_enable_device(dev);
  if (ret < 0) {
    printk(KERN_WARNING "%s: unable to initialize PCI device\n", __FUNCTION__);
    goto cleanup_pci_enable;
  }

  /* Reserve PCI I/O and memory resources */
  ret = pci_request_regions(dev, "dragon_pci_net");
  if (ret < 0) {
    printk(KERN_WARNING "%s: unable to reserve PCI resources\n", __FUNCTION__);
    goto cleanup_regions;
  }

  /* Inspect PCI BARs and search 1rst IORESOURCE_MEM */
  for (i=0; i < DEVICE_COUNT_RESOURCE; i++) {
    if (pci_resource_len(dev, i) == 0)
      continue;

    if (pci_resource_start(dev, i) == 0)
      continue;

    printk(KERN_INFO "%s: BAR %d (%#08x-%#08x), len=%d, flags=%#08x\n", __FUNCTION__, i, (u32)pci_resource_start(dev, i), (u32) pci_resource_end(dev, i), (u32) pci_resource_len(dev, i), (u32) pci_resource_flags(dev, i));

    // Remap if IORESOURCE_MEM
    if (pci_resource_flags(dev, i) & IORESOURCE_MEM) {
      priv->mmio = ioremap(pci_resource_start(dev, i), pci_resource_len(dev, i));
    
      if (priv->mmio == NULL) {
	printk(KERN_WARNING "%s: unable to remap I/O memory\n", __FUNCTION__);
	
	ret = -ENOMEM;
	goto cleanup_ioremap;
      }

      priv->mmio_len = pci_resource_len(dev, i);

      printk(KERN_INFO "%s: I/O memory has been remaped at 0x%p\n", __FUNCTION__, priv->mmio);
      break;
    }
  }

  return 0;

 cleanup_ioremap:
  pci_release_regions(dev);
 cleanup_regions:
  pci_disable_device(dev);
 cleanup_pci_enable:
  unregister_netdev (ndev);

  return ret;
}

static void dragon_pci_net_remove(struct pci_dev *dev)
{
  struct net_device *ndev = pci_get_drvdata(dev);
  struct dragon_pci_net_private *priv = netdev_priv(ndev);

  unregister_netdev(ndev);

  iounmap(priv->mmio);
  pci_release_regions(dev);
  pci_disable_device(dev);

  printk(KERN_INFO "%s: device removed\n", __FUNCTION__);
}

static struct pci_driver dragon_pci_net_driver = {
  .name =	"dragon_pci_net",
  .id_table =	dragon_pci_net_id_table,
  .probe =	dragon_pci_net_probe,		/* Init one device */
  .remove =	dragon_pci_net_remove,		/* Remove one device */
};

/*
 * Init and Exit
 */
static int __init dragon_pci_net_init(void)
{
  int ret;

  /* Register PCI driver */
  ret = pci_register_driver(&dragon_pci_net_driver);
  if (ret < 0) {
    printk(KERN_WARNING "%s: unable to register PCI driver\n", __FUNCTION__);
    return ret;
  }

  return 0;
}

static void __exit dragon_pci_net_exit(void)
{
  pci_unregister_driver(&dragon_pci_net_driver);
}

/*
 * Module entry points
 */
module_init(dragon_pci_net_init);
module_exit(dragon_pci_net_exit);
