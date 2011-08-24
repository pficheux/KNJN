KNJN Dragon PCI Linux drivers
=============================

dragon-ctrl	Linux user-space control program (by Nicolas Noble)
driver		Linux USB driver for Dragon
Windaube	Some Win$ programs used for test (compiled with MinGW)

Here are some USB programs/drivers for Dragon PCI.

- dragon-ctrl is used to load design files from Linux instead of using Windows
FPGAconf.exe provided by KNJN.

Loading design needs to load firmware.hex first:


# dragon-ctrl -i firmware.hex reboot
# dragon-ctrl -b bitfile.bit program

If you want to save firmware to EEPROM you can use the following command:

# dragon-ctrl -i firmware.hex write-eeprom

Please note I had some problem with USB_reg_banks.bit => sometimes it does not
work if loaded with dragon-ctrl but works fine if loaded with FPGAconf.


- driver/dragon_usb is a Linux driver (kernel space) for Dragon. Please read
driver/dragon_usb/README.txt for more information.

Enjoy.

PF
pierre.ficheux@gmail.com

8/2011
