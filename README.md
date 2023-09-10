# Simple Busybox/Linux Setup 
A simple QEMU/KVM busybox/linux setup for kernel development/hacking

## Downloading
You can download the busybox and the kernel archives
using the download script:
```
./download.sh
```
Provided kernel and the busybox versions are:
- Kernel version => `5.15.131`
- Busybox version => `1.36.1`

You can change these by editing the `download.sh` script

## Building
#### You will need to install the essential build tools!
To build the kernel and busybox, run the build script:
```
./build.sh
```

## Running
To start the box in a QEMU debugging session, run the 
run script:
```
./run.sh
```
