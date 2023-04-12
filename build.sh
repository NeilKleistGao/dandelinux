#!/bin/sh -l

echo "starting build dandelinux..."

echo "Y" | pacman -Sy --needed sudo archiso
