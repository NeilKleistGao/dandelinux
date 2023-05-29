# Dandelinux
[![dandelinux build test](https://github.com/NeilKleistGao/dandelinux/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/NeilKleistGao/dandelinux/actions/workflows/build.yml)

Dandelinux = Dandelion + Linux.

A toy linux distribution for game development :)

Adapted from [archcraft](https://github.com/archcraft-os/archcraft).

## Build
You can execute `local.*` (depends on your OS) to build the system.
Before you start, make sure `docker` is available in your terminal.

## Notes
### Network
After installation, if your network doesn't work, try:
```bash
ip link # see your device's name
dhcpcd $DEVICE_NAME_HERE
```

see: [Arch Linux - connect: Network is unreachable](https://unix.stackexchange.com/questions/80493/arch-linux-connect-network-is-unreachable)
