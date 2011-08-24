// Sample code to drive a Text LCD module on Dragon, using
// the USB port.
// (c) fpga4fun.com KNJN LLC - 2004, 2005

// About USB:
// USB works in burst mode. In USB terminology, we use "bulk" 
// packets. USB bulk packets are 64 bytes long maximum. 
// The PC can send more at once (up to 65535), but the 
// driver/hardware will slice them in 64 bytes chunks. 
// If you send 100 bytes, the Spartan-II will receive them, 
// but in 2 steps, a first burst of 64 bytes, followed very 
// quickly (but still a few µs later) by a burst of 36 bytes.

// This example code sends data to the LCD module using very short 
// packets (one ot two bytes long) but the functions shown can 

// handle up to 65535 bytes at once.

#include <windows.h>
#include <assert.h>

HANDLE* DragonDeviceHandle;

/////////////////
// Open and close the USB driver
void USB_Open()
{
  DragonDeviceHandle = CreateFile("\\\\.\\DRAGON_USB-0",  GENERIC_WRITE, FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);

  assert(DragonDeviceHandle != INVALID_HANDLE_VALUE);
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
  assert(nBytes == buffersize);	// make sure everything was sent
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
  int i, l, l1, l2;
  USB_Open();

  // We send bytes one by one - not very efficient from the USB point of view, but keeps 
  // things simple
  // For commands, it's ok to send 2 bytes at once because the first one (0x00) is not sent 
  // to the LCD module but is just there to indicate that the second byte is a command to the LCD
  // Remember, the PC is little-endian, so that's 0x00 followed by 0x38 !!
  USB_WriteWord(0x3800); // 8 bits
  USB_WriteWord(0x0F00); // cursor ON
  USB_WriteWord(0x0100); // clear screen
  Sleep(2);

  l = strlen(av[1]);

  l1 = (l > 20 ? 20 : l);

  // Send text
  for (i = 0 ; i < l1 ; i++)
    USB_WriteChar(av[1][i]);

  if (l > 20) {
    // next line
    USB_WriteWord(0xC000); 

    for ( ; i < l ; i++)
      USB_WriteChar(av[1][i]);
  }
  
  USB_Close();
}
