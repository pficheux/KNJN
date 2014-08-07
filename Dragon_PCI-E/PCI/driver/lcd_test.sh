#!/bin/bash
#
# Send a string to Dragon board through PCI-E Linux driver
#
PCI_TEST_PRG=dragon_pci_test
PCI_TEST_DEV=/dev/dragon_pci_mem0

if [ "$1" != "" ]; then
    STR="$1"
else
    STR="Hello Linux !"
fi

# Init LCD + clear
$PCI_TEST_PRG $PCI_TEST_DEV 1 2 38 0 q
$PCI_TEST_PRG $PCI_TEST_DEV 1 2 f 0 q
$PCI_TEST_PRG $PCI_TEST_DEV 1 2 1 0 q

sleep 1

# Send string
L=${#STR}
i=0
while [ $i -lt $L ]; do
    $PCI_TEST_PRG $PCI_TEST_DEV 0 2 "'${STR:$i:1}" 0 q
    i=$(expr $i + 1)
done
