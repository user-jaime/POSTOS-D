#!/usr/bin/bash 
# Cbase3.sh (DEBIAN EDITION) 01June2022

cp -r /media/kodi/jaime2/POSTOS/Flatery-Dark.tar.gz ~
cp -r /media/kodi/jaime2/POSTOS/05-Flat-Remix-GTK-Blue-Dark_20201129.tar.xz ~
cp -r /media/kodi/jaime2/POSTOS/Dracula-alt-style.tar.xz ~
cp -r /media/kodi/jaime2/POSTOS/sparrow_*_amd64.deb ~
cp -r /media/kodi/jaime2/POSTOS/veracrypt-1.25.9-Debian-11-amd64.deb ~
cp -r /media/kodi/jaime2/Wallpaper ~
cp -r /media/kodi/jaime2/POSTOS/PM.*.odt ~
cp -r /media/kodi/jaime2/POSTOS/Fluent.Reader.*.AppImage ~

mkdir ~/.icons ~/.themes ~/Scripts
rm -r ~/Music ~/Public ~/Templates ~/Videos

tar -xvf Flatery-Dark.tar.gz
mv Flatery-Dark ~/.icons
sleep 3
rm -r Flatery-Dark.tar.gz

tar -xvJf 05-Flat-Remix-GTK-Blue-Dark_20201129.tar.xz
mv Flat-Remix-GTK-Blue-Dark ~/.themes
sleep 3
rm -r 05-Flat-Remix-GTK-Blue-Dark_20201129.tar.xz

tar -xvJf Dracula-alt-style.tar.xz
mv Dracula-alt-style ~/.themes
sleep 3
rm -r Dracula-alt-style.tar.xz

sudo dpkg -i sparrow_*_amd64.deb
sleep 3
rm -r sparrow_*_amd64.deb

sudo dpkg -i veracrypt-1.25.9-Debian-11-amd64.deb
sleep 3
rm -r veracrypt-1.25.9-Debian-11-amd64.deb
apt --fix-broken install

usb="/media/kodi/jaime2/POSTOS/DXdot"
dl="rsync -avh --delete"

$dl $usb/.cache/ ~/.cache
$dl $usb/.config/ ~/.config
$dl $usb/.local/ ~/.local
$dl $usb/.mozilla/ ~/.mozilla
$dl $usb/.sparrow/ ~/.sparrow
$dl $usb/.vim/ ~/.vim
$dl $usb/.bash_aliases ~/.bash_aliases
$dl $usb/.bashrc ~/.bashrc
$dl $usb/.profile ~/.profile
$dl $usb/.tmux.conf ~/.tmux.conf
$dl $usb/.viminfo ~/.viminfo
$dl $usb/.vimrc ~/.vimrc
$dl $usb/.Xresources ~/.Xresources

cd ~
rm *.sh
cd /media/kodi/jaime2/POSTOS/DMaint
cp -r bye.sh daily.sh rsync.sh sd.sh wallsync.sh ~
cd ~
chmod 700 *.sh
sleep 5
systemctl reboot
