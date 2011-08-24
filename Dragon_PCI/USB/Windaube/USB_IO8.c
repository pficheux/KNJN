// USB_IO8 test program
//
// 
// USB_IO8   4 LED3 on   (close to Ethernet)
//           2 LED2 on   (close to FPGA) 
//           1 LED1 on   (close to USB)
//


#include <windows.h>
#include <assert.h>
#include <stdio.h>

HANDLE* DragonDeviceHandle;

/////////////////
// Open and close the USB driver
void USB_Open()
{
  DragonDeviceHandle = CreateFile("\\\\.\\DRAGON_USB-0", GENERIC_WRITE, FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);

  assert(DragonDeviceHandle!=INVALID_HANDLE_VALUE);
}

void USB_Close()
{
  CloseHandle(DragonDeviceHandle);
}

/////////////////
// Low-level USB functions to send and receive bulk packets
// Do not use directly but use USB_Write and USB_Read instead
void USB_BulkWrite(ULONG pipe, void* buffer, WORD buffersize)
{
  int nBytes;
  DeviceIoControl(DragonDeviceHandle, 0x222051, &pipe, sizeof(pipe), buffer, buffersize, &nBytes, NULL);
  assert(nBytes==buffersize);	// make sure everything was sent
}

/////////////////
// User functions to send and receive from Dragon
// Can send or receive from 1 to 65535 bytes at once

// When sending more than 64 bytes, packets will reach Dragon in bursts of 64 bytes
void USB_Write(void* buffer, WORD buffersize)
{
  USB_BulkWrite(2, buffer, buffersize);
}


/////////////////
// Helper functions for the LCD
void USB_WriteChar(char c)
{
  USB_Write(&c, 1);
}

void USB_WriteWord(WORD w)
{
  USB_Write(&w, 2);
}

/////////////////
int main(int ac, char **av)
{
  char c = atoi(av[1]);

  printf ("Dragon PCI USB Test (IO8)\n\r");
  
  USB_Open();

  printf ("Writing 0x%x\n\r", c);
  USB_WriteChar(c);
  printf ("OK\n\r");
  USB_Close();
}
