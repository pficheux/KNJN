#include <stdio.h>
#include <windows.h>
#include <assert.h>

HANDLE* DragonDeviceHandle;

/////////////////
// Open and close the USB driver
void USB_Open()
{
	DragonDeviceHandle = CreateFile("\\\\.\\DRAGON_USB-0", 
		GENERIC_WRITE, FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);

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
	assert(nBytes=buffersize);	// make sure everything was sent
}

void USB_BulkRead(ULONG pipe, void* buffer, WORD buffersize)
{
	int nBytes;
	DeviceIoControl(DragonDeviceHandle, 0x22204E, &pipe, sizeof(pipe), buffer, buffersize, &nBytes, NULL);
	assert(nBytes=buffersize);	// make sure everything was read
}

/////////////////
// User functions to send and receive from Dragon
// Can send or receive from 1 to 65535 bytes at once

// When sending more than 64 bytes, packets will reach Dragon in bursts of 64 bytes
void USB_Write(void* buffer, WORD buffersize)
{
	USB_BulkWrite(2, buffer, buffersize);
}

// When reading more than 64 bytes, data will be read in bursts of 64 bytes
void USB_Read(void* buffer, WORD buffersize)
{
	if(buffersize==0) return;
	printf ("write\n");
	USB_BulkWrite(6, &buffersize, 2);
	printf ("read\n");
	USB_BulkRead(4, buffer, buffersize);
	printf ("OK\n");
}

int main()
{
	char buffer[64];
	int i;

	USB_Open();

	USB_Read(buffer, 64);
	for (i = 0 ; i < 64 ; i++)
		printf ("%02x", buffer[i] & 255);
	printf ("\n");

	USB_Close();
}
