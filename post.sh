  
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
echo "|                            Post Install                           |"
echo "|                                                                   |"
echo "+-------------------------------------------------------------------+"
sleep 3

echo "/n/n"

echo "Let's get started!"
sleep 2

echo "/n/n

echo "Setting machine name..."
echo "discovery" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 discovery.localdomain discovery" >> /etc/hosts
echo "...done!"
sleep 2

echo "Setting the keymap..."
echo "KEYMAP=us-acentos" >> /etc/vconsole.conf
echo "...done!"
sleep 2

echo "Setting system wide language..."
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo LC_COLLATE=C >> /etc/locale.conf
sed -i '/#en_US.UTF-8/s/^#//g' /etc/locale.gen
locale-gen
echo "...done!"
sleep 2

echo "Setting the time zone..."
ls -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc --utc
echo "...done!"
sleep 2

echo "Setting some environment variables..."
echo "EDITOR=nano visudo" >> /etc/environment
echo "GTK_IM_MODULE=cedilla" >> /etc/environment
echo "QT_IM_MODULE=cedilla" >> /etc/environment
echo "...done!"
sleep 2

echo "Setting the root password..."
echo root:password | chpasswd
echo "...done!"
sleep 2

echo "Creating my user account..."
useradd -m -g users -G wheel,sys,log,network,floppy,scanner,power,rfkill,users,video,storage,optical,lp,audio,adm,ftp,mail,git -s /bin/zsh brahm
echo brahm:password | chpasswd
echo "...done!"
sleep 2

echo "Giving user wheel access..."
sed -i '/%wheel ALL=(ALL) ALL'/s/^#//g /etc/sudoers
echo "...done!"
sleep 2

echo "Installing the boot manager..."
pacman -S --noconfirm grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "...done!"
sleep 2

# The end!
printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
