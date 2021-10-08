#!/bin/bash
#
# Led blinking on Dragon_PCI-L
#

PCI_TEST_PRG=dragon_pci_test
PCI_TEST_DEV=/dev/dragon_pci_mem0

M=0

while [ 1 ]; do
    $PCI_TEST_PRG $PCI_TEST_DEV 1 $M 0 q
    # write mask from 0 to 3
    M=$(($(expr $M + 1) %4))
    sleep 1
done
