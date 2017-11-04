KNJN DragonPCI-E Linux driver
=============================

1- Introduction

Driver works with KNJN PCI example design (FPGA Project - PCI Express).

2- Building driver

Simply type :

$ make

3- Loading and testing driver

You can load driver with:

# insmod dragon_pci_mem.ko (or 'modprobe dragon_pci_mem' if you install it with 'sudo make install')

Once driver is loaded you should see output in kernel log with 'dmesg' :

# insmod dragon_pci_mem.ko
# dmesg
[ 1957.887070] dragon_pci_mem: found 10ee:0100
[ 1957.887074] dragon_pci_mem: using major 248 and minor 0 for this device
[ 1957.887373] dragon_pci_mem: BAR 0 (0xfe3ff000-0xfe3fffff), len=4096, flags=0x040200
[ 1957.887384] dragon_pci_mem: IORESOURCE_MEM memory has been remaped at 0xf843a000

Once BAR0 is detected you can read/write memory through the driver (in 32 bits mode !) : 

# dd if=/dev/zero of=/dev/dragon_pci_mem0 bs=4

# hexdump -C /dev/dragon_pci_mem0 
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000

# dd if=message.txt of=/dev/dragon_pci_mem0 bs=4
# hexdump -C /dev/dragon_pci_mem0 
00000000  4b 4e 4a 4e 20 62 6f 61  72 64 73 20 61 72 65 20  |KNJN boards are |
00000010  74 68 65 20 62 65 73 74  20 21 21 0a 00 00 00 00  |the best !!.....|
00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000040  4b 4e 4a 4e 20 62 6f 61  72 64 73 20 61 72 65 20  |KNJN boards are |
00000050  74 68 65 20 62 65 73 74  20 21 21 0a 00 00 00 00  |the best !!.....|
00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
...

4- Interrupt support

PCI-L board uses MSI. The current design generates 1 interrupt / sec (check 
/proc/interrupts).

$ grep dragon /proc/interrupts 
53:        217        252   PCI-MSI-edge      dragon_pci_mem

Because of design limitation (?) interrupt handling won't work after 
removing/loading (rmmod/insmod) the driver -> you need to reboot the system !

5- Leds

You can use 'dragon_pci_test' program to control LED1/LED2.

# dragon_pci_test /dev/dragon_pci_mem0 1 <led_mask> 0

where <led_mask> is 0, 1, 2, 3 (modulo)

# ./led_test.sh

Enjoy

PF
11/2017
