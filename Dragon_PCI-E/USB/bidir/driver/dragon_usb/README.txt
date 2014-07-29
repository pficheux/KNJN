Here is a Linux USB driver for KNJN Dragon-E for FX2_bidir.bit design file.

You can compile the driver with :

$ make

You can load it with :

# insmod dragon_usb.ko

Once driver is loaded, you can access Dragon-E with both /sys entry or /dev/drag_usb0 (or /sys entry). Don't forget to load design file *before* loading Linux driver ! 

Each time you "read" de board, the driver sends 5 bytes et get 1 byte as reply (incremented by 5 for each read).

# cat /dev/dragon_usb0 
143
# cat /dev/dragon_usb0 
148
# cat /sys/bus/usb/drivers/dragon_usb/3-2\:1.0/reply
151

Enjoy.

PF
07/2014 
