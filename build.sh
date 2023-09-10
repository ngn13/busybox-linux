#!/bin/bash -e 

# build the sources
echo ">>> Building kernel"
cd kernel
cp ../kernel-config .config
make -j $(nproc)
echo ">>> Building busybox"
cd ../busybox
cp ../busybox-config Config.in
make -j $(nproc)
cd ..

# setup dirs
echo ">>> Setting up build dirs"
rm -rf dist
mkdir -p dist/dev
mkdir -p dist/proc
mkdir -p dist/sys
mkdir -p dist/bin
mkdir -p dist/tmp
cd dist 

# copy busybox and the init file 
cp ../busybox/busybox ./bin/busybox
cp ../init.sh ./init 
chmod 777 ./init

# setup busybox commands
echo ">>> Installing busybox"
cd bin
for p in $(./busybox --list); do 
  ln -s /bin/busybox ./$p
done
cd ..

# build cpio
echo ">>> Building initramfs"
find . | cpio -ov --format=newc | gzip -9 > initramfs.cpio.gz

# copy the kernel file
cp ../kernel/arch/x86_64/boot/bzImage . 

echo ">>> Complete!"
