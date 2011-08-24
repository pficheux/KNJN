KNJN Dragon PCI Ethernet test
=============================

Here is a small procedure to test Ethernet/UDP on Linux.

1- Load TENBASET.bit design file (using FPGAconf or USB/dragon-ctrl)

TENBASET.bit set IP addr to 192.168.3.40 and eth addr to 16:FD:22:04:B1:61.

2- Add Dragon eth address with arp command

# arp -s 192.168.3.40 16:FD:22:04:B1:61
# arp -a
...
? (192.168.3.40) at 16:fd:22:04:b1:61 [ether] PERM on eth0 

3- Test with 'nc'

$ echo 'hello dragon' | nc -u  192.168.3.40 1024

Dragon should send back 'hello dragon' (use Wireshark to check).

Enjoy.

PF
pierre.ficheux@gmail.com

08/2011


