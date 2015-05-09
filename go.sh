#!/bin/bash
rm output/build/linux-custom/.stamp_built
rm output/build/linux-custom/.stamp_images_installed
rm output/build/linux-custom/.stamp_target_installed
rm output/build/linux-custom/usr/initramfs_data.cpio
rm output/build/linux-custom/usr/initramfs_data.o
make
