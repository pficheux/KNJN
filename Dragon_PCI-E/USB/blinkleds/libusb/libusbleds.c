#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>
#include <unistd.h>
#include <libusb-1.0/libusb.h>

// Dragon-E IDs
#define VENDOR_ID       0x04b4
#define PRODUCT_ID 	0x8614

#define USB_STATUS_OK 0

/*
void the_end (libusb_device *dev, struct libusb_configure_descriptor *desc) 
{
  libusb_free_config_descriptor(desc);
  libusb_close (dev);
  libusb_exit (NULL);
}
*/

int main (int ac, char **av)
{
  libusb_device *device;
  libusb_device_handle *handle;
  struct libusb_config_descriptor *configure_descriptor;
  int err, i, status;

  /*==============================*/
  /*======== init libusb =========*/
  /*==============================*/
  status = libusb_init(NULL);
  if (status != USB_STATUS_OK) {
    fprintf (stderr, "libusb_init error, status= %d\n", status);
    exit (1);
  }


  /*=================================*/
  /*======== find/open USB device ===*/
  /*=================================*/
  handle  = libusb_open_device_with_vid_pid(NULL, VENDOR_ID, PRODUCT_ID);
  if (handle == NULL)
    {
      fprintf (stderr, "Could not find/open device\n");
      libusb_exit (NULL);
      exit (1);
    }
	
  device = libusb_get_device (handle);	
  if(device == NULL)	
    {
      fprintf(stderr, "Could not get device\n");
      libusb_close(handle);
      libusb_exit(NULL);
      exit (1);		
    }
	
  /*=========================================*/
  /*======== Get the configure desc =========*/
  /*=========================================*/
  status = libusb_get_active_config_descriptor(device, &configure_descriptor);
  if (status != USB_STATUS_OK) 
    {
      fprintf (stderr, "Failed to get configure descriptor, status= %d\n", status);
      libusb_close(handle);
      libusb_exit(NULL);
      exit (1);
    }
	
  /*==========================================================================*/
  /*======== if Interface is active on the kernel ==> Detach this interface ==*/
  /*==========================================================================*/			
  if (libusb_kernel_driver_active(handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber) == 1) 
    {
      status = libusb_detach_kernel_driver(handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber);
      if (status != USB_STATUS_OK) 
	{
	  fprintf(stderr, "Failed to detach kernel driver, status= %d\n", status);
	  libusb_free_config_descriptor(configure_descriptor);
	  libusb_close(handle);
	  libusb_exit(NULL);
	  return 1;
	}
    }

  /*=================================================*/
  /*======== Interface claim before any transfert  ==*/
  /*=================================================*/
  status = libusb_claim_interface(handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber);	
  if(status != USB_STATUS_OK)
    {
      printf("error interface claim, error= %d\n", status);
      libusb_free_config_descriptor(configure_descriptor);
      libusb_close(handle);
      libusb_exit(NULL);
      exit (1);
    }

  libusb_set_interface_alt_setting(handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber, 1);

  for (i = 0 ; i <= 100 ; i++) {
    int transferred;

    if ((err = libusb_bulk_transfer(handle, 0x02, (unsigned char *)&i, 1, &transferred, 5000)))
      fprintf (stderr, "libusb_bulk_transfert error= %d\n", err);
    
    usleep (100000);
  }

  libusb_free_config_descriptor(configure_descriptor);
  libusb_close(handle);
  libusb_exit(NULL);

  return 0;
}
