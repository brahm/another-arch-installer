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
echo "|                            Post Install                           |"
echo "|                                                                   |"
echo "+-------------------------------------------------------------------+"
sleep 2

echo ""
echo ""

echo "Let's get started!"
sleep 2

echo ""
echo ""

echo "Installing AUR helper..."
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing missing firmware..."
paru --noconfirm -S aic94xx-firmware wd719x-firmware upd72020x-fw
sudo mkinitcpio -p linux
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing system tools and services..."
pacman -S --noconfirm --needed smbclient cifs-utils fuseiso fuse3 fuse2 autofs gptfdisk exfat-utils ntfs-3g haveged xdg-usr-dirs cronie lsof usbutils lm_sensors powertop flatpak pacman-contrib bash-completion zsh-completion zsh-syntax-highlighting man-pages man-db dmidecode xdg-desktop-portal lsb-release hddtemp 
paru --noconfirm -S auto-cpufreq
systemctl enable cronie
systemctl enable haveged
systemctl enable auto-cpufreq
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing utilities..."
pacman -S --noconfirm --needed unarchiver bzip2 gzip lrzip lz4 lzip lzop zstd p7zip unrar zip unzip lhasa arj ncompress par2cmdline sharutils htop nnn tree exa bat jq rsync tracerout nmap net-tools speedtest-cli wget neofetch
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing audio..."
pacman -S --noconfirm --needed pipewire pipewire-pulse pulseeffects pipewire-alsa pipewire-jack gst-plugin-pipewire pipewire-media-session gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugins-bad gst-libav libde265 gstreamer-vaapi
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing video..."
pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-server-utils xf86-video-amdgpu xf86-input-libinput xf86-input-synaptics mesa lib32-mesa libva-mesa-driver mesa-vdpau vulcan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d opencl-mesa

echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing printer..."
pacman -S --noconfirm --needed cups cups-pdf cups-filters bluez-cups ghostscript imagemagick
systemctl enable cups.service
echo "...done!"
sleep 2

echo ""
echo "*********************************************************************"
echo ""

echo "Installing fonts..."
echo ""
echo "TrueType Fonts..."
pacman -S --noconfirm --needed ttf-dejavu ttf-droid ttf-ibm-plex noto-fonts noto-fonts-extra ttf-roboto ttf-ubuntu-font-family adobe-source-sans-pro-fonts
paru --noconfirm -S ttf-ms-fonts ttf-vista-fonts ttf-tahoma ttf-mac-fonts

echo ""
echo "Monospaced Fonts..."
pacman -S --noconfirm --needed ttf-anonymous-pro ttf-cascadia-code ttf-fira-mono ttf-fira-code adobe-source-code-pro-fonts ttf-roboto-mono

echo ""
echo "Chinese, Japanese, Korean, Vietnamese Fonts..."
pacman -S --noconfirm --needed adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk ttf-hannom 

echo ""
echo "Ancient Scripts..."
paru --noconfirm -S ttf-ancient-fonts ttf-qurancomplex-fonts ttf-sil-lateef ttf-ubraille opensiddur-hebrew-fonts ttf-x2

echo ""
echo "Cyrillic Fonts..."
paru --noconfirm -S ttf-paratype

echo ""
echo "Emoji Fonts..."
pacman -S --noconfirm --needed noto-fonts-emoji ttf-joypixels gnu-free-fonts ttf-arphic-uming and ttf-indic-otf
paru --noconfirm -S ttf-twemoji-color

echo ""
echo "Math Fonts..."
pacman -S --noconfirm --needed texlive-core texlive-fontsextra otf-latin-modern, otf-latinmodern-math
paru --noconfirm -S ttf-computer-modern-fontsAUR otf-cm-unicode

echo ""
fc-cache -f

echo ""
echo "...done!"
sleep 2

clear
echo ""
echo ""
echo "Post-install has finished!"
echo ""
echo ""
echo "Now it's time to choose between turn this system into a:"
echo "Desktop: https://raw.githubusercontent.com/brahm/another-arch-installer/main/4-gnome.sh"
echo "Server: https://raw.githubusercontent.com/brahm/another-arch-installer/main/5-server.sh"

echo ""
echo ""
printf "\e[1;32mType 'curl -L https://onefromthelist.com/scritp.sh > script.sh', and run 'sh script.sh'.\e[0m"

