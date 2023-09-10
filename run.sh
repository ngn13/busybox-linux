#!/bin/bash -e
qemu-system-x86_64 -kernel dist/bzImage -initrd dist/initramfs.cpio.gz -nographic -append "console=ttyS0" -s 
