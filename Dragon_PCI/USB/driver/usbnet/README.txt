Testing usbnet avec DragonPCI
=============================

- Load USB_IO8.bit to the board

- Compile dragon_usbnet.ko and sendRawEth, then insert module

$ make
# modprobe usbnet
# insmod dragon_usbnet.ko

You can now control the 3 leds by sending raw Ethernet packets containing
led mask value (0 -> 7)

# ./usbnet_leds.sh

- Test with "ping"

# ifconfig usb0 1.2.3.4
# arp -s 1.2.3.5 01:02:03:04:05:06
# ping 1.2.3.5

=> You can see packets with 'tcpdump -i usb0 -X' or usbmon.

Enjoy

PF
 
