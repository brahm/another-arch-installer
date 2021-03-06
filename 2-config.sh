#!/bin/bash

# This is another custom automatic installation script for Arch Linux
# Made to install Arch on an Apple Mac Pro 5,1 with a AMD RX 580
# Copyleft (ɔ) 2021 Wagner Brahm (https://wagnerbrahm.com.br)
# Permission to copy and modify is granted under a CC BY 4.0 License
# Last revised 2021/04/08

clear

echo "+-------------------------------------------------------------------+"
echo "|                                                                   |"
echo "|                 This is another custom automatic                  |"
echo "|                installation script for Arch Linux                 |"
echo "|                                                                   |"
echo "|                                Config                             |"
echo "|                                                                   |"
echo "+-------------------------------------------------------------------+"
sleep 2

echo ""
echo ""

echo "Let's finish this..."
sleep 2

echo ""
echo ""

echo "Setting machine name..."
echo "discovery" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 discovery.localdomain discovery" >> /etc/hosts
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Setting the keymap..."
echo "KEYMAP=us-acentos" >> /etc/vconsole.conf
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Setting system wide language..."
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo LC_COLLATE=C >> /etc/locale.conf
sed -i '/#en_US.UTF-8/s/^#//g' /etc/locale.gen
locale-gen
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Setting the time zone..."
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Setting some environment variables..."
echo "EDITOR=nano" >> /etc/environment
echo "GTK_IM_MODULE=cedilla" >> /etc/environment
echo "QT_IM_MODULE=cedilla" >> /etc/environment
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo ""
echo "Setting the root password..."
echo root:password | chpasswd
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Creating my user account..."
useradd -m -g users -G wheel,sys,log,network,floppy,scanner,power,rfkill,users,video,storage,optical,lp,audio,adm,ftp,mail,git -s /bin/zsh brahm
echo brahm:password | chpasswd
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Giving user wheel access..."
sed -i '/%wheel ALL=(ALL) ALL'/s/^#//g /etc/sudoers
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Configuring the network..."
pacman -S --noconfirm --needed dkms broadcom-wl-dkms networkmanager dialog wpa_supplicant bluez bluez-libs bluez-utils bluez-tools ntp openssh samba inetutils dnsutils avahi iptables ipset firewalld nss-mdns reflector
curl -L https://raw.githubusercontent.com/brahm/another-arch-installer/main/smb.conf > /etc/samba/smb.conf
systemctl enable NetworkManager
systemctl enable NetworkManager-dispatcher.service
systemctl enable bluetooth
systemctl enable sshd
systemctl enable smb.service
systemctl enable nmb.service
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable firewalld
systemctl enable acpid
systemctl enable ntp
smbpasswd -a brahm
nmcli device wifi
nmcli dev wifi connect "wifi name here" password wifi-password-here
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Regenerating initrd image..."
mkinitcpio -p linux
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing the boot manager..."
pacman -S --noconfirm grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "...done!"
sleep 2

clear
echo ""
echo ""
echo "Configuration has finished!"
echo ""
echo ""
echo "Enjoy!"
echo ""
echo ""
printf "\e[1;32mType exit, umount -a and reboot.\e[0m"
echo ""
echo ""
echo ""
