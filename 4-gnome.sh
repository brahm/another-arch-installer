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
echo "|                           Gnome Desktop                           |"
echo "|                                                                   |"
echo "+-------------------------------------------------------------------+"
sleep 2

echo ""
echo ""

echo "Let's get ready to browse the web..."
sleep 2

echo ""
echo ""

echo "Installing Gnome Shell..."
sudo pacman -S --noconfirm gnome-shell gnome-shell-extensions gnome-session gnome-settings-daemon mutter xdg-user-dirs-gtk gnome-menus gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb tracker3 tracker3-miners eog eog-plugins gnome-software gnome-software-packagekit-plugin xdg-desktop-portal-gtk grilo grilo-plugins system-config-printer gdm gnome-backgrounds gnome-control-center gnome-system-monitor gnome-terminal gnome-themes-extra gnome-user-docs gnome-getting-started-docs gnome-user-share nautilus rygel sushi yelp evince file-roller gedit gedit-plugins dconf-editor chrome-gnome-shell gnome-tweaks 
systemctl enable gdm
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing Gnome Core and Circle applications..."
sudo pacman -S --noconfirm drawing seahorse gnome-games gnome-firmware gnome-epub-thumbnailer fragments baobab cheese gnome-books gnome-boxes gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-contacts gnome-disk-utilit gnome-documents gnome-font-viewer  gnome-keyring gnome-logs gnome-maps gnome-music gnome-photos gnome-remote-desktop gnome-screenshot gnome-video-effects gnome-weather totem vino gnome-sound-recorder
paru --noconfirm -S apostrophe blanket cozy-audiobooks dialect identity bitstower-markets metadata-cleaner newsflash gnome-obfuscate-git shortwave webfontkitgenerator-git video-trimmer
flatpak install flathub org.gaphor.Gaphor
flatpak install flathub org.gustavoperedo.FontDownloader
flatpak install flathub io.github.lainsce.Khronos
flatpak install flathub org.gnome.Solanum
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing some desktop applications..."
sudo pacman -S --noconfirm firefox simplescreenrecorder lib32-simplescreenrecorder obs-studio transmission-gtk gimp pitivi lollypop
paru --noconfirm -S spotify microsoft-edge-dev-bin silo-whatsapp teams silo-office365 davinci-resolve
echo "...done!"
sleep 2

echo "Installing Utilities..."
sudo pacman -S --noconfirm signal-desktop telegram-desktop discord caprine cawbird borg bleachbit conky conky-manager
paru --noconfirm -S flat-remix corectrl sublime-text-3 dropbox typora edex-ui pdftricks pika-backup stacer-bin
echo "...done!"
sleep 2

clear
echo ""
echo ""
echo "Gnome Desktop has finished!"
echo ""
echo ""
echo "Now it's time to choose between turn this system into a: "
echo "Workstation: https://raw.githubusercontent.com/brahm/another-arch-installer/main/6-dev.sh"
echo "Gamestation: https://raw.githubusercontent.com/brahm/another-arch-installer/main/7-game.sh"
echo ""
echo ""
echo "But first, we need restart the machine."
echo ""
echo ""
echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
