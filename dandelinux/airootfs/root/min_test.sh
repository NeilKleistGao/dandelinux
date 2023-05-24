#!/usr/bin/env bash

pacman-key --init
pacman-key --populate

cfdisk /dev/sda

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2

mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda3 /mnt/boot

pacman -Sy
pacstrap /mnt base linux linux-firmware grub vim net-tools networkmanager sudo dhcpcd

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

reboot
