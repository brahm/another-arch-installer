#!/bin/bash

# This is another custom automatic installation script for Arch Linux
# Made to install Arch on an Apple Mac Pro 5,1 with a AMD RX 580
# Copyleft (ɔ) 2021 Wagner Brahm (https://wagnerbrahm.com.br)
# Permission to copy and modify is granted under a CC BY 4.0 License
# Last revised 2021/04/08

echo "+-------------------------------------------------------------------+"
echo "|                                                                   |"
echo "|                 This is another custom automatic                  |"
echo "|                installation script for Arch Linux                 |"
echo "|                                                                   |"
echo "|                            Base Install                           |"
echo "|                                                                   |"
echo "+-------------------------------------------------------------------+"
sleep 3

echo "/n/n/n/n"

echo "Let's get started!"
sleep 2

echo "Wiping the partition table..."
wipefs --all --force /dev/sda
echo "...done!"
sleep 2

echo "Creating a GPT partition table and the /boot (EFI) and / (root) partitions..."
echo -e ',512M,U\n,,L' | sfdisk --label=gpt /dev/sda
echo "...done!"
sleep 2

echo "Formatting the drivers..."
mkfs.vfat -F32 /dev/sda1
mkfs.xfs -f /dev/sda2
echo "...done!"
sleep 2

echo "Mounting the drives..."
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
lsblk
echo "...done!"
sleep 2

echo "Testing the internet connectivity..."
case "$(curl -s --max-time 2 -I http://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) echo "HTTP connectivity is up, moving on...";;
  5) echo "The web proxy won't let us through";;
  *) echo "The network is down or very slow";;
esac
sleep 2

echo "Finding the best mirror list for downloading Arch Linux..."
reflector --verbose --latest 100 --protocol https --threads 24 --sort rate --save /etc/pacman.d/mirrorlist
echo "...done!"
sleep 2

echo "Updating the keyring..."
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys
pacman -Syy
echo "...done!"
sleep 2

echo "Installing the base packages..."
pacstrap /mnt base linux linux-firmware linux-headers intel-ucode dosfstools xfsprogs sudo zsh nano git
echo "...done!"
sleep 2

echo "Generating fstab for the drives..."
genfstab -U -p /mnt >> /mnt/etc/fstab
echo "...done!"
sleep 2

echo "Creating a RAM drive..."
echo "tmpfs    /tmp    tmpfs    rw,nodev,nosuid,size=2G    0 0" >> /mnt/etc/fstab
echo "...done!"
sleep 2

echo "Creating the swap file..."
dd if=/dev/zero of=/mnt/swapfile bs=1M count=34816 status=progress
chmod 600 /mnt/swapfile
echo "/swapfile    none    swap    defaults    0 0" >> /mnt/etc/fstab
echo "...done!"
sleep 2

echo "/n/n"
echo "*********************************************************************"
echo "/n"
echo "Base install has finished!"
echo "/n/n"
echo "After entering into the new system, get and run the post.sh script"
echo "to continue configuring this system."
echo "/n/n"
sleep 3

echo "Entering as root into the new system..."
arch-chroot /mnt
