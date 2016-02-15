Testing usbnet avec DragonPCI
=============================

- Load USB_IO8.bit to the board

- Compile dragon_usbnet.ko and sendRawEth, then insert module

$ make
# modprobe usbnet
# insmod dragon_usbnet.ko


- Test with "ping"

# ifconfig usb0 1.2.3.4
# arp -s 1.2.3.5 01:02:03:04:05:06
# ping 1.2.3.5

=> You can see packets with 'tcpdump -i usb0 -X' or usbmon.

You can also control the 3 leds by sending ICMP packet with specific pattern.

# ping 1.2.3.5 -p 0 -> leds off
# ping 1.2.3.5 -p 7 -> leds on
# ping 1.2.3.5 -p 1 -> leds 1 ON
...

# ./led_test.sh 1.2.3.5



Enjoy

PF
