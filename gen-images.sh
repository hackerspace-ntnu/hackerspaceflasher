#!/bin/bash

NUM_DEVICES=22
HOSTNAME_PREFIX="B"

for i in $(seq 1 $NUM_DEVICES); do 
	sudo mount -o loop,offset=1048576 ../raspbian.img ~/img
	sudo bash -c "sed \"s|LOLID|${HOSTNAME_PREFIX}$i|g\" ../installer-config.txt > /home/hackerspace/img/installer-config.txt"
	sync
	sleep 1
	sudo umount ~/img
	sleep 1
	cp ../raspbian.img raspbian-${HOSTNAME_PREFIX}$i.img
done
