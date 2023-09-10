#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devtmpfs udev /dev 
sysctl -w kernel.printk="2 4 1 7"
clear
echo "welcome kernel hacker!"
/bin/sh
poweroff -f
