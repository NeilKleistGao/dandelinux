sudo pacman -Sy --needed archiso

cp -rf /usr/share/archiso/configs/releng ./profile

sudo mkarchiso -v profile
