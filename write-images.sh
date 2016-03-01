#!/bin/bash

OUTDEV=/dev/sdc
HOSTNAME_PREFIX="B"
NUM_DEVICES=22

for i in $(seq 1 $NUM_DEVICES); do
	read -p "Press any key to continue "
	sudo dd if=raspbian-$HOSTNAME_PREFIX$i.img of=$OUTDEV
done
