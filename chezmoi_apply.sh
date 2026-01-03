#!/usr/bin/env bash

set -e

echo "Building and installing yay from AUR..."
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
echo "yay installed successfully."

echo "Installing auth packages..."
yay -S --needed --noconfirm openssh 1password-cli 1password chezmoi
echo "Auth packages installed successfully."

echo "Configuring chezmoi for 1Password integration..."

mkdir -p ~/.config/chezmoi

if [ ! -f ~/.config/chezmoi/chezmoi.toml ]; then
  cat >~/.config/chezmoi/chezmoi.toml <<'EOF'
[onepassword]
type = "service"
EOF
  echo "Created ~/.config/chezmoi/chezmoi.toml"
else
  echo "~/.config/chezmoi/chezmoi.toml already exists"
fi
