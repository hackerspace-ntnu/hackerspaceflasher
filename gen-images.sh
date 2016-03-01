#!/bin/bash

NUM_DEVICES=22
HOSTNAME_PREFIX="B"

echo "NTNU-Hackerspace Amazing Raspberry Pi Image Configuration ©2016"
echo ""

read -p "Write number of devices to configure: " NUM_DEVICES
read -p "Hostname prefix: " HOSTNAME_PREFIX

if [[ $NUM_DEVICES -lt 1 ]]; then
echo "Usage: $0"
echo ""
echo "Example: $0"
echo "  Write number of devices to configure: 20"
echo "  Hostname prefix: B"
echo ""
	exit 1
fi

for i in $(seq 1 $NUM_DEVICES); do 
	sudo mount -o loop,offset=1048576 ../raspbian.img ~/img
	sudo bash -c "sed \"s|LOLID|${HOSTNAME_PREFIX}$i|g\" ../installer-config.txt > /home/hackerspace/img/installer-config.txt"
	sync
	sleep 1
	sudo umount ~/img
	sleep 1
	cp ../raspbian.img raspbian-${HOSTNAME_PREFIX}$i.img
done
