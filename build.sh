#!/bin/sh -l

echo "starting build dandelinux..."

pacman -Sy --needed sudo archiso --noconfirm

# copy config files
cp -rf /dandelinux ./profile
mkdir /run/shm

sudo mkarchiso -o /output -v ./profile
