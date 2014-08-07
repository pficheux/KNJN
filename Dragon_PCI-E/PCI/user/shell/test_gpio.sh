#!/bin/sh
#
# led + GPIO blinking about every 100ms
#
X=0

while [ 1 ]
do
    dragon_pci_test /dev/dragon_pci_mem0 0 2 $X 0 q
    X=$(expr $X + 1)
    sleep 0.05
done
