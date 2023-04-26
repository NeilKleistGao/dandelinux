#!/bin/sh -l

echo "starting build dandelinux..."

pacman -Sy --needed sudo archiso --noconfirm

cp -rf /usr/share/archiso/configs/releng ./profile
mkdir /run/shm

# copy config files
cp /dandelinux/profiledef.sh ./profile/profiledef.sh
cp /dandelinux/pacman.conf ./profile/pacman.conf

sudo mkarchiso -o /output -v ./profile
