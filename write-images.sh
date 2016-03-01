#!/bin/bash

OUTDEV=/dev/sdc
HOSTNAME_PREFIX="B"
NUM_DEVICES=20

echo "NTNU-Hackerspace Amazing Raspberry Pi flasher ©2016"
echo ""

if [[ $NUM_DEVICES -lt 1 ]]; then
echo "Usage: $0"
echo ""
echo "Example: $0"
echo "  ..."
	exit 1
fi

echo "Get ready to flash!"

for i in $(seq 1 $NUM_DEVICES); do
	read -p "Press any key to continue "
	sudo dd if=raspbian-$HOSTNAME_PREFIX$i.img of=$OUTDEV
done
