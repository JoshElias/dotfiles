# Setup

- Create and boot from Arch Linux Live USB
- Select Canada mirrors
- Single root user
- Add multilib repo
- minimal type
- btrfs, best effort
- snapper snapshots
- limine bootloader

# Install Yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# ZSH Setup
yay -S zsh
chsh -s /usr/bin/zsh
create `/etc/zsh/zshenv` with
```
ZDOTDIR=/home/josh/.config/zsh
```

# Install Ly
sudo systemctl disable getty@tty2.service
sudo systemctl enable ly@tty2.service

# Extra
- Add /usr/sbin to PATH
    - Hyprland and Mise need this

# Install Packages


# KDE Wallet
- Create wallet named "kdewallet" with same pass as user

# Enable Services
systemctl --now enable bluetooth.service
systemctl --now enable power-profiles-daemon.service

systemctl --user --now enable pipewire.service
systemctl --user --now enable pipewire-pulse.service
systemctl --user --now enable wireplumber.service
systemctl --user --now enable waybar.service
systemctl --user --now enable hyprpolkitagent.service
systemctl --user --now enable mako.service

# Set default audio device

# Set GPG key
 gpg --recv-keys "new key"

# Increase vm.max_map_count



