#!/bin/sh

IF=${1-eth0}

X=0

while [ 1 ]; do
    ./sendRawEth $IF $X
    X=$(expr $X + 1)
    sleep 1
done
