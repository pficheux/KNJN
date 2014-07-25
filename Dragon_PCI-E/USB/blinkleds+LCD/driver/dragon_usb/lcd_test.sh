#!/bin/bash
#
# Send a string to Dragon board through USB Linux driver
#

if [ "$1" != "" ]; then
    STR="$1"
else
    STR="Hello Linux !"
fi

# Init LCD
echo -n 3800
echo -n 0f00
echo -n 0100
sleep 1
# Send string
L=${#STR}
i=0
while [ $i -lt $L ]; do
    echo -n "'${STR:$i:1}"
    i=$(expr $i + 1)
done
