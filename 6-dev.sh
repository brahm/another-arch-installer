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
echo "|                       Developer Workstation                       |"
echo "|                                                                   |"
echo "+-------------------------------------------------------------------+"
sleep 2

echo ""
echo ""

echo "Let's get ready to build the web..."
sleep 2

echo ""
echo ""

echo "Installing virtual machine manager..."
pacman -S --noconfirm --needed qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat edk2-ovmf
paru --noconfirm -S libguestfs
systemctl enable libvirtd
sed -i '/# unix_sock_grou = "libvirt"/s/^#//g' /etc/libvirt/libvirtd.conf
sed -i '/# unix_sock_rw_perms = "0770"/s/^#//g' /etc/libvirt/libvirtd.conf
systemctl start libvirtd
virsh net-start default
virsh net-autostart --network default
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing virtual machine manager ..."
pacman -S filezilla 
