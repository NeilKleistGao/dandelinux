#!/usr/bin/env bash

sudo pacman -Syu && sudo pacman -S archlinuxcn-keyring
sudo pacman -Sy yay --noconfirm

# some packages need no `sudo`
yay -S visual-studio-code-bin --noconfirm
yay -S iflyime --noconfirm
yay -S qcef --noconfirm
yay -S google-chrome --noconfirm
yay -S godot-mono --noconfirm

cat software.x86_64 | while read line
do
  if [[ $line == \#* ]]
  then
    echo $line
  else
    echo "installing" $line
    sudo yay -S $line --noconfirm
  fi
done

touch ~/.xprofile
echo "export GTK_IM_MODULE=fcitx" >> ~/.xprofile
echo "export QT_IM_MODULE=fcitx" >> ~/.xprofile
echo "export XMODIFIERS=\"@im=fcitx\"" >> ~/.xprofile

chsh -s /usr/bin/zsh
sh -c "$(curl -fssL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO: dotfiles
