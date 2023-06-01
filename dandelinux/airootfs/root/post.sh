#!/usr/bin/env bash

pacman -Syu && pacman -S archlinuxcn-keyring
pacman -Sy yay --noconfirm

cat software.x86_64 | while read line
do
  if [[ $line == \#* ]]
  then
    echo $line
  else
    echo "installing" $line
    yay -Sy $line --noconfirm
  fi
done
