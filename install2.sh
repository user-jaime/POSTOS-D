#!/usr/bin/bash
# Cbase0.sh 12July2022

# *** SCRIPT MUST BE RUN AS ROOT ***

if [ "$EUID" -ne 0 ]
  then echo ""
  echo "           *** YA GOTTA BE ROOT TO RUN THIS SCRIPT!! *** "
  echo ""
  exit
fi

clear 
set -e


apt update;apt upgrade

apt -y install gnome-session gnome-shell gnome-backgrounds gnome-applets gnome-control-center mutter gjs

apt update;apt upgrade

insa="apt -y install"

read -r -p "Install Chromium? [Y/n] " prompt
if [ "$prompt" == "Y" ]
then
$insa chromium
fi

$insa curl
$insa firefox-esr
$insa ffmpeg
#$insa git
$insa gnome-shell-extensions
$insa libreoffice-writer
$insa neofetch
$insa okular
$insa resolvconf
$insa rsync
$insa shellcheck
$insa stacer
$insa sudo
$insa terminator
$insa tmux
$insa ufw
$insa vim
$insa vlc
$insa wget
$insa xterm

apt update;apt upgrade

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
sleep 5
cd
echo '' >> .bashrc
echo '### STARSHIP PROMPT ###' >> .bashrc
echo 'eval "$(starship init bash)"' >> .bashrc
cat .bashrc
sleep 2
apt -y remove kdeconnect
apt -y autoremove

apt update;apt upgrade
systemctl reboot

#source ~/POSTOS-D/Cbase3.sh
