# Dandelinux
[![dandelinux build test](https://github.com/NeilKleistGao/dandelinux/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/NeilKleistGao/dandelinux/actions/workflows/build.yml)

Dandelinux = Dandelion + Linux.

A toy linux distribution for game development :)

The awesome configuration is adapted from [manilarome/the-glorious-dotfiles](https://github.com/manilarome/the-glorious-dotfiles).

## Build
You can execute `local.*` (depends on your OS) to build the system.
Before you start, make sure `docker` is available in your terminal.

## Install
### Check Network
TODO:

### Create Partitions
Use `lsblk` to check your devices.

For example, if your device name is `/dev/sda`, execute `cfdisk` to create partitions:
```bash
cfdisk /dev/sda
```

Please choose `dos` and create 3 partitions for main system, booting and swapping separately,
marking booting partition as bootable.

### Execute Install Script
Before executing, please use `vim` to update devices and partitions information:
```bash
DEVICE_NAME=/dev/sda
BOOT_PART=/dev/sda1
SWAP_PART=/dev/sda2
MAIN_PART=/dev/sda3
```

And invoke `chmod`:
```bash
chmod 777 install.sh
```

Finally, you can execute:
```bash
./install.sh
```

You can remove pre-installed software by add `#` or add software you want
by editing `preinstall.x86_64`.

### Initialization
Execute:
```bash
arch-chroot /mnt
```

You can find the init script in `/home/init.sh`.
You can update your time zone, username, and host name.

After `chmod 777 /home/init.sh`, execute `/home/init.sh`
and set password for the `root` user.

After rebooting, you can enjoy your OS!

### Software Installation
We prepared some useful software. You can execute `/home/post.sh` to install them automatically,
The software list is in `/home/software.x86_64`.

After installation, please reboot your device.
