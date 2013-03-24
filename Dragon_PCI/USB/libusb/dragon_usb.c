/*
 * Dragon PCI control program, libusb-1.0 based
 *
 *   Copyright (C) 2012 Pierre Ficheux (pierre.ficheux@gmail.com)
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
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>
#include <libusb-1.0/libusb.h>

// USB IDs
#define VENDOR_ID       0x0547
#define PRODUCT_ID 	0x2131

#define USB_STATUS_OK 0

libusb_device *device;
libusb_device_handle *handle;
struct libusb_config_descriptor *configure_descriptor;
int status;

void close_device_error (char *s, int status) 
{
  if (status != USB_STATUS_OK)
    fprintf(stderr, "%s, status= %d\n", s, status);

  libusb_free_config_descriptor(configure_descriptor);
  libusb_close(handle);
  libusb_exit(NULL);

  exit (status);
}

main (int ac, char **av)
{
  int l;
  char i;

  /* Init libusb */
  status = libusb_init(NULL);
  if (status != USB_STATUS_OK) {
    fprintf (stderr, "libusb_init error, status= %d\n", status);
    exit (1);
  }

  /* Find/open USB device */
  handle  = libusb_open_device_with_vid_pid(NULL, VENDOR_ID, PRODUCT_ID);
  if (handle == NULL) {
      fprintf (stderr, "Could not find/open device\n");
      libusb_exit (NULL);
      exit (1);
    }
	
  device = libusb_get_device (handle);	
  if(device == NULL) {
      fprintf(stderr, "Could not get device\n");
      libusb_close(handle);
      libusb_exit(NULL);
      exit (1);		
    }
	
  /* Get the configure desc */
  status = libusb_get_active_config_descriptor(device, &configure_descriptor);
  if (status != USB_STATUS_OK) {
      fprintf (stderr, "Failed to get configure descriptor, status= %d\n", status);
      libusb_close(handle);
      libusb_exit(NULL);
      exit (1);
    }
	
  /* If Interface is active on the kernel, detach this interface */
  if (libusb_kernel_driver_active(handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber) == 1) {
      status = libusb_detach_kernel_driver(handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber);
      if (status != USB_STATUS_OK) 
	close_device_error ("Failed to detach kernel driver", status);
    }

  /* Interface claim before any transfert */
  status = libusb_claim_interface(handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber);	
  if(status != USB_STATUS_OK)
    close_device_error("error interface claim", status);

  status = libusb_set_interface_alt_setting (handle, configure_descriptor->interface[0].altsetting[0].bInterfaceNumber, 1);
  if(status != USB_STATUS_OK)
    close_device_error("error interface alt setting", status);

  /* Send  led mask 0x00 -> 0x07 */
  for (i = 0 ; i < 8 ; i++) {
    status = libusb_bulk_transfer (handle, 2, &i, 1, &l, 5000);
    if(status != USB_STATUS_OK)
      close_device_error("error bulk transfer", status);
    else
      printf ("mask= 0x%02x\n", i);
    sleep (1);
  }

  close_device_error ("", USB_STATUS_OK);
}
