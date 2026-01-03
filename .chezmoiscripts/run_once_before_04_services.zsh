#!/usr/bin/env zsh

echo "Enabling necessary services..."

sudo systemctl --now enable bluetooth.service

sudo systemctl disable getty@tty2.service
sudo systemctl enable ly@tty2.service

systemctl --user --now enable pipewire.service
systemctl --user --now enable pipewire-pulse.service
systemctl --user --now enable wireplumber.service
systemctl --user --now enable waybar.service
systemctl --user --now enable hyprpolkitagent.service
systemctl --user --now enable hyprpaper.service
systemctl --user --now enable mako.service

elephant service enable
systemctl --user --now enable elephant.service

echo "Configuring ly display manager to use colormix animation..."
sudo sed -i 's/^#\?animation = .*/animation = colormix/' /etc/ly/config.ini
