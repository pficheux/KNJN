#!/bin/sh

X=0

while [ 1 ]; do
    ./sendRawEth usb0 $X
    X=$(expr $X + 1)
    sleep 1
done
