#!/bin/sh -l

echo "starting build dandelinux..."

echo "Y" | pacman -Sy --needed sudo archiso

cp -rf /usr/share/archiso/configs/releng ./profile

sudo mkarchiso -v profile
