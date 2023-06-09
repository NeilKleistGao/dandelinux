#!/usr/bin/env bash

pacman-key --init
pacman-key --populate

DEVICE_NAME=/dev/sda
BOOT_PART=/dev/sda1
SWAP_PART=/dev/sda2
MAIN_PART=/dev/sda3

mkfs.ext4 $BOOT_PART
mkfs.ext4 $MAIN_PART
mkswap $SWAP_PART
swapon $SWAP_PART

mount $MAIN_PART /mnt
mkdir /mnt/boot
mount $MAIN_PART /mnt/boot

pacman -Syu
cat preinstall.x86_64 | while read line
do
  if [[ $line == \#* ]]
  then
    echo $line
  else
    echo "installing" $line
    pacstrap /mnt $line
  fi
done

genfstab -U /mnt >> /mnt/etc/fstab
cp init.sh /mnt/home/init.sh
cp post.sh /mnt/home/post.sh
cp software.x86_64 /mnt/home/software.x86_64
cp -r dotfiles /mnt/home/dotfiles
