#!/bin/sh -l

echo "starting build dandelinux..."

pacman -Sy --needed sudo archiso --noconfirm

cp -rf /usr/share/archiso/configs/releng ./profile
mkdir /run/shm

sudo mkarchiso -v ./profile
