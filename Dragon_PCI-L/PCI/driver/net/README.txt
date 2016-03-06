Dragon network driver testing
=============================

1- Insert module

# insmod dragon_pci_net.ko 

2- Init 'dragon0' interface

# ifconfig dragon0 1.2.3.4

3- Create a 'fake' host to ping

# arp -s 1.2.3.5 01:02:03:04:05:06

4- Ping (-f) to remote host -> should start (fast) random led blinking

# ping -f 1.2.3.5

5- tcpdump utility should display ICMP + input packets (sent by driver)

# tcpdump -i dragon0 -X
...
17:21:57.380863 IP 1.2.3.4 > 1.2.3.5: ICMP echo request, id 2345, seq 4, length 64
	0x0000:  4500 0054 192d 4000 4001 1970 0102 0304  E..T.-@.@..p....
	0x0010:  0102 0305 0800 2f48 0929 0004 a561 8156  ....../H.)...a.V
	0x0020:  a8cf 0500 0809 0a0b 0c0d 0e0f 1011 1213  ................
	0x0030:  1415 1617 1819 1a1b 1c1d 1e1f 2021 2223  .............!"#
	0x0040:  2425 2627 2829 2a2b 2c2d 2e2f 3031 3233  $%&'()*+,-./0123
	0x0050:  3435 3637                                4567
17:21:57.464002 IP2 bad-hlen 0
	0x0000:  2020 2020 204b 4e4a 4e20 626f 6172 6473  .....KNJN.boards
	0x0010:  2061 7265 2074 6865 2062 6573 7420 2121  .are.the.best.!!
	0x0020:  2020 2020 2020 2020 2020 2020 2020 2020  ................
	0x0030:  2020                                     ..
17:21:58.540977 IP2 bad-hlen 0
	0x0000:  2020 2020 2020 4b4e 4a4e 2062 6f61 7264  ......KNJN.board
	0x0010:  7320 6172 6520 7468 6520 6265 7374 2021  s.are.the.best.!
	0x0020:  2120 2020 2020 2020 2020 2020 2020 2020  !...............
	0x0030:  2020                               
...

6- Leds test

Led blinking could be done with :

$ ./led_test.sh 1.2.3.5


