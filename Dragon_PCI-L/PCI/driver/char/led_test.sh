#!/bin/bash
#
# Led blinking on Dragon_PCI-L
#
#set -x

PCI_TEST_PRG=dragon_pci_test
PCI_TEST_DEV=/dev/dragon_pci_mem0

M=0

while [ 1 ]; do
    $PCI_TEST_PRG $PCI_TEST_DEV 1 $M 0 q
    M=$(expr $M + 1)
    if [ $M -gt 3 ]; then
        M=0
    fi
    sleep 1
done
