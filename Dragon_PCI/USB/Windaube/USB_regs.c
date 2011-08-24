// USB_regs test program
//
// 
// USB_regs 80001000 LED3 on   (close to Ethernet)
//          01000002 LED2 on   (close to FPGA) 
//          00010000 LED1 on   (close to USB)
//          ^   ^
//          |   |__ addr
//          |__ data  


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



void USB_WriteDWord(DWORD dw)
{
   USB_Write(&dw, 4);
}


/////////////////
int main(int ac, char **av)
{
  int x;

  printf ("Dragon PCI USB Test (regs)\n\r");
  
  USB_Open();

  sscanf (av[1], "%x", &x);
  printf ("Writing 0x%x\n\r", x);
  USB_WriteDWord(x);
  USB_Close();
}
