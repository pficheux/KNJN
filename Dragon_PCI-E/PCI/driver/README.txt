KNJN DragonPCI-E Linux driver
=============================

1- Introduction

Driver works with HDL/PCIe.bit design, based on :

http://www.knjn.com/private_files/FX2/FPGAproject_PCIE_FullExample.rar 

 or 

http://www.fpga4fun.com/PCI-Express5.html

2- Building driver

Simply type :

$ make

3- Loading and testing driver

You can load driver with:

# insmod dragon_pci_mem.ko (or 'modprobe dragon_pci_mem' if you install it with 'sudo make install')

Once driver is loaded you should see output in kernel log with 'dmesg' :

# insmod dragon_pci_mem.ko
# dmesg
[ 3891.510203] dragon_pci_mem: found 10ee:0007
[ 3891.510208] dragon_pci_mem: using major 250 and minor 0 for this device
[ 3891.510232] dragon_pci_mem 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
[ 3891.510242] dragon_pci_mem: BAR 0 (0xfe2ff000-0xfe2fffff), len=4096, flags=0x040200
[ 3891.510246] NOT cacheable ! 
[ 3891.510264] dragon_pci_mem: I/O memory has been remaped at 0xf7e3e000
[ 3891.510269] dragon_pci_mem: BAR 6 (0xfe300000-0xfe3fffff), len=1048576, flags=0x04e200
[ 3891.510272] cacheable ! 
[ 3891.510595] dragon_pci_mem: I/O memory has been remaped at 0xfa500000

Once BAR0 is detected you can read/write memory through the driver :

# cat /etc/issue > /dev/dragon_pci_mem0
# cat /dev/dragon_pci_mem0
Fedora release 14 (Laughlin)
Kernel \r on an \m (\l)

4- Interrupt support

PCI-E uses MSI. The current design generates 1 interrupt / sec (check /proc/interrupts).

$ grep dragon /proc/interrupts 
  52:         14         25   PCI-MSI-edge      dragon_pci_mem

Because of design limitation (?) interrupt handling won't work after removing/loading (rmmod/insmod) the driver -> reboot !

5- Leds and GPIO

You can use 'dragon_pci_test' program to control V2/V3 leds.

# dragon_pci_test /dev/dragon_pci_mem0 0 2 <led_mask> 0

where <led_mask> is 0, 1, 2, 3, ...

A GPIO output is available (pin V15)  and value is same as LED[0] (pin V3).

6- Text LCD

Text LCD is supported by default design, just try 'lcd_test.sh' (based on 'dragon_pci_test') in driver directory.



Enjoy

PF
7/2014
