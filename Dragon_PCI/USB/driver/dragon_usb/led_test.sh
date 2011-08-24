#!/bin/sh
STR=(H e l l o ' ' L i n u x !)

echo -n 3800 > /dev/dragon_usb0
echo -n 0f00 > /dev/dragon_usb0
echo -n 0100 > /dev/dragon_usb0
sleep 2

for i in ${!STR[*]}
do
    C=${STR[i]}
    if [ X$C = "X" ]; then
	echo -n 20 > /dev/dragon_usb0
    else
	printf "%x" \'${STR[i]} > /dev/dragon_usb0
    fi
done
