#!/usr/bin/env bash

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

passwd root
exit
