![alt text][logo]

# Another Custom Automatic Installation Script For Arch Linux

<br />

This script was made to automatically install Arch Linux 2021.04.01 on an Apple Mac Pro with the following specifications: 

<br />

- Model: A1289
- Family: Mid-2010
- ID: MacPro5,1
- Processors: 2 Xeon X5650 2.66 GHz 6 Core
- ROM/Firmware Type: EFI 64-Bit
- RAM: 32 GB 1333 MHz DDR3 ECC SDRAM
- Storage: 1 TB SSD / 3 TB HDD
- Video Card: AMD Radeon RX 580 8 GB VRAM
- Standard Ethernet: 2 Gigabit 10/100/1000BASE-T
- Wireless: AirPort Extreme (802.11a/b/g/n) and Bluetooth 2.1+EDR
- Optical: 18x DL "Superdrive"

<br />

Feel free to download and adapt it for your own needs.

<br />

For use it:
1. Boot from your Arch Linux installer.
2. Run this commands:
```
# curl -L https://raw.githubusercontent.com/brahm/another-arch-installer/main/base.sh > base.sh
# sh base.sh
```
3. Go get some refreshments.
4. After enter the new system, to constinue the instalation, run this:
```
# curl -L https://raw.githubusercontent.com/brahm/another-arch-installer/main/post.sh > post.sh
# sh post.sh
```
5. Enjoy!

<br /><br />

Copyleft (ɔ) 2021 Wagner Brahm (https://wagnerbrahm.com.br).

[logo]: https://archlinux.org/static/logos/archlinux-logo-black-90dpi.0c696e9c0d84.png "Arch Linux"
