#!/usr/bin/env zsh

echo "Building and installing yay from AUR..."
cd ~
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
