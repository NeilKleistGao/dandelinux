#!/usr/bin/env bash

pacman -Syu && pacman -S archlinuxcn-keyring
pacman -Sy yay --noconfirm

# some packages need confirmation
yay -S visual-studio-code-bin

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

touch ~/.xprofile
echo "export GTK_IM_MODULE=fcitx" >> ~/.xprofile
echo "export QT_IM_MODULE=fcitx" >> ~/.xprofile
echo "export XMODIFIERS=@im=fcitx" >> ~/.xprofile

chsh -s /usr/bin/zsh
sh -c "$(curl -fssL https://raw,github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO: dotfiles
