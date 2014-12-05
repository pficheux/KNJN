#!/bin/bash
#
# Led blinking on Dragon_PCI-E
#
PCI_TEST_PRG=dragon_pci_test
PCI_TEST_DEV=/dev/dragon_pci_mem0

M=0
while [ 1 ]; do
    $PCI_TEST_PRG $PCI_TEST_DEV 0 2 $M 0 
    M=$(expr $M + 1)
    sleep 1
done
