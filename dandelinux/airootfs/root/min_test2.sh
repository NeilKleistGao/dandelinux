#!/usr/bin/env bash

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo "dandelinux" > /etc/hostname
vim /etc/hosts

passwd root
exit
