#!/bin/sh

X=0

while [ 1 ]
do
	echo $X > /dev/dragon_usb0
	X=$(expr $X + 1)
	sleep 0.1
done

