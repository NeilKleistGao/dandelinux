#!/usr/bin/env bash

USERNAME=NeilKleistGao

sudo pacman -Syu && sudo pacman -S archlinuxcn-keyring
sudo pacman -Sy yay --noconfirm

cat software.x86_64 | while read line
do
  if [[ $line == \#* ]]
  then
    echo $line
  else
    echo "installing" $line
    yay -S $line --noconfirm
  fi
done

touch ~/.xprofile
echo "export GTK_IM_MODULE=fcitx" >> ~/.xprofile
echo "export QT_IM_MODULE=fcitx" >> ~/.xprofile
echo "export XMODIFIERS=\"@im=fcitx\"" >> ~/.xprofile

sh -c "$(curl -fssL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

cp /home/dotfiles/.zshrc ~/.zshrc
cp /home/dotfiles/.p10k.zsh ~/.p10k.zsh
cp -r /home/dotfiles/awesome ~/.config/awesome
cp -r /home/dotfiles/Code ~/.config/Code

xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -s "awesome" -a

chsh -s /usr/bin/zsh

cd ~/.config/Code
chmod 777 install.sh
./install.sh
