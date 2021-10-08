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
[93471.211712] dragon_pci_mem: found 10ee:0100
[93471.211717] dragon_pci_mem: using major 239 and minor 0 for this device
[93471.212172] dragon_pci_mem: IORESOURCE_MEM memory has been remaped at 0x00000000a14b6c75
[93471.212343] dragon_pci_mem: IRQ 35 registered !

1- Writing data to memory

You can use 'dragon_pci_test'to write data.

# dragon_pci_test /dev/dragon_pci_mem0 <count> <start> <increment>


# dragon_pci_test /dev/dragon_pci_mem0 4 0 1
Write 4 long-word(s), value is 0x00000000, increment is 0x00000001

buf[0] = 0x00000000
buf[1] = 0x00000001
buf[2] = 0x00000002
buf[3] = 0x00000003
Wrote 16 chars

# hexdump -C /dev/dragon_pci_mem0
00000000  00 00 00 00 01 00 00 00  02 00 00 00 03 00 00 00  |................|
00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
...


2- Leds

You can also use 'dragon_pci_test' program to control LED1/LED2.

# dragon_pci_test /dev/dragon_pci_mem0 1 <led_mask> 0

where <led_mask> is 0, 1, 2, 3 (modulo)

# ./led_test.sh

2- Interrupt support

PCI-L board uses MSI. The current design generates 1 interrupt / sec (check 
/proc/interrupts).

$ grep dragon /proc/interrupts 
53:        217        252   PCI-MSI-edge      dragon_pci_mem

Because of design limitation (?) interrupt handling won't work after 
removing/loading (rmmod/insmod) the driver -> you need to reboot the system !

Enjoy

PF
10/2021
