#!/usr/bin/env bash

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

HOST_NAME=dandelinux
TIME_ZONE=Asia/Shanghai
USERNAME=NeilKleistGao

ln -sf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime
hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo zh_CN.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo $HOST_NAME >> /etc/hostname
echo "127.0.0.1        localhost" >> /etc/hosts
echo "::1              localhost" >> /etc/hosts
echo "127.0.1.1        $HOST_NAME.localdomain        $HOST_NAME" >> /etc/hosts

systemctl enable --now NetworkManager
systemctl enable gdm

passwd

useradd -m -G wheel $USERNAME
passwd $USERNAME

touch /etc/sudoers.d/42
echo "root ALL=(ALL) ALL" >> /etc/sudoers.d/42
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.d/42
