#!/usr/bin/bash
# Xinstall.sh 
# 23 July 2022

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# *** SCRIPT MUST BE RUN AS ROOT ***

if [ "$EUID" -ne 0 ]
  then echo ""
  echo "           *** YA GOTTA BE ROOT TO RUN THIS SCRIPT!! *** "
  echo ""
  exit
fi  


# xorg display server installation
apt install -y xorg 

# Build-essential.
apt install -y build-essential 

# Microcode for Intel/AMD 
# sudo apt install -y amd-microcode
apt install -y intel-microcode 

#XFCE packages
apt install -y xfce4 xfce4-goodies

# Browser Installation (eg. chromium)
apt install -y firefox-esr 

# Network File Tools/System Events
apt install -y dialog mtools acpi acpid gvfs-backends

systemctl enable avahi-daemon
systemctl enable acpid

# Sound packages (pulseaudio installed prior)
apt install -y alsa-utils volumeicon-alsa

# Neofetch/HTOP
apt install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
apt install -y exa

# Printing and bluetooth (if needed)
#sudo apt install -y cups
#sudo apt install -y bluez blueman

#sudo systemctl enable bluetooth
#sudo systemctl enable cups

# Command line text editor -- nano preinstalled  -- I like micro but vim is great
# sudo apt install -y micro
apt install -y vim

# Install fonts
apt install fonts-font-awesome fonts-powerline fonts-liberation2 fonts-liberation fonts-terminus


# Install LightDM GTK Greeter Settings (lightdm,lightdm-gtk-greeter installs with xfce)

apt install -y lightdm-gtk-greeter-settings
systemctl enable lightdm

# BULK INSTALL
insa="apt -y install"

$insa chromium
$insa curl
$insa ffmpeg
$insa libreoffice-writer
$insa okular
$insa resolvconf
$insa rsync
$insa shellcheck
$insa stacer
$insa terminator
$insa tmux
$insa ufw
$insa vlc
$insa wget
$insa xterm

apt update;apt upgrade

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

apt -y remove kdeconnect
apt -y autoremoveapt
apt update;apt upgrade
systemctl reboot

printf "\e[1;32mTime to reboot! Thanks!\e[0m\n"
