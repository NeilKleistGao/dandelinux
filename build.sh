#!/bin/sh -l

echo "starting build dandelinux..."

sudo pacman -Sy archiso
cp -rf /usr/share/archiso/configs/releng ./profile
sudo mkarchiso -v profile
