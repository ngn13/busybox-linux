#!/bin/bash -e

#########################################
### CHANGE THESE VERSIONS IF YOU WANT ### 
KERNEL_VERSION=5.15.131               ###
BUSYBOX_VERSION=1.36.1                ###
#########################################

KERNEL_MAJOR=$(echo $KERNEL_VERSION | cut -d "." -f1)

echo ">> Starting the download script"
echo ">> Kernel version  => $KERNEL_VERSION"
echo ">> Busybox version => $BUSYBOX_VERSION"

echo ">> Downloading the kernel"
wget https://cdn.kernel.org/pub/linux/kernel/v$KERNEL_MAJOR.x/linux-$KERNEL_VERSION.tar.xz
echo ">> Extracting the kernel"
tar xf linux-$KERNEL_VERSION.tar.xz
mv linux-$KERNEL_VERSION linux

echo ">> Downloading busybox"
wget https://www.busybox.net/downloads/busybox-$BUSYBOX_VERSION.tar.bz2
echo ">> Extracting busybox"
tar xf busybox-$BUSYBOX_VERSION.tar.bz2
mv busybox-$BUSYBOX_VERSION busybox

rm *.tar.bz2 *.tar.xz
