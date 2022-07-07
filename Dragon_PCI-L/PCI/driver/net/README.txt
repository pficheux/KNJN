Testing the Dragon network driver
=================================

1- Compile and insert the module

$ make
# insmod dragon_pci_net.ko 

2- Init the 'dragon0' interface (192.168.2.1 as an example)

# ifconfig dragon0 192.168.2.1

3- Create a 'fake' host to ping (192.168.2.2)

# arp -s 192.168.2.2 77:2C:63:6F:1A:93

4- Ping the remote host with the 'ff' pattern

$ ping -p ff 192.168.2.2

5- The tcpdump utility should display ICMP and input packets (a string sent by the driver)

$ sudo tcpdump -i dragon0 -X
...
12:37:25.863895 IP2 
	0x0000:  2020 4b4e 4a4e 2062 6f61 7264 7320 6172  ..KNJN.boards.ar
	0x0010:  6520 7468 6520 6265 7374 2021 2120 2020  e.the.best.!!...
	0x0020:  2020 2020 2020 2020 2020 2020 2020 2020  ................
	0x0030:  2020                                     ..
12:37:26.756584 IP pierre-SH87R > 192.168.2.2: ICMP echo request, id 2091, seq 1, length 64
	0x0000:  4500 0054 9d26 4000 4001 182f c0a8 0201  E..T.&@.@../....
	0x0010:  c0a8 0202 0800 6f2e 082b 0001 66b7 c662  ......o..+..f..b
	0x0020:  0000 0000 488b 0b00 0000 0000 ffff ffff  ....H...........
	0x0030:  ffff ffff ffff ffff ffff ffff ffff ffff  ................
	0x0040:  ffff ffff ffff ffff ffff ffff ffff ffff  ................
	0x0050:  ffff ffff                             

6- Leds test

Led blinking could be done with:

$ ./led_test.sh 192.168.2.2



