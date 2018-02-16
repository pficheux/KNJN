#!/bin/sh
set -x

RPI=192.168.1.19

dragon_pci_test /dev/dragon_pci_mem0 1 $1 0
#ssh  root@$RPI /home/root/camera.sh; scp root@$RPI:~/dragon_pci.png ~pierre/public_html
ssh  root@$RPI raspistill -w 640 -h 480 -e png -o dragon_pci.png; scp root@$RPI:~/dragon_pci.png ~pierre/public_html

