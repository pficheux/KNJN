#!/bin/sh
#
# Led blinking with ICMP packets :)
#

P=0

if [ $# -eq 0 ]; then
    echo "Usage: $0 IP_addr"
    exit 1
fi

while [ 1 ]
do
    # Send the right pattern (mask)
    ping $1 -p $P &
    sleep 1

    # kill ping as remote host will never reply
    kill $!

    P=$(expr $P + 1)
    if [ $P -eq 8 ]; then
	P=0
    fi	
done
