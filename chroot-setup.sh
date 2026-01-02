#!/usr/bin/env bash

set -e

USERNAME="${1:-}"

if [ -z "$USERNAME" ]; then
  echo "Usage: $0 USERNAME"
  exit 1
fi

echo "Installing zsh package..."
# Install zsh from pacman
pacman -S --noconfirm zsh

echo "Setting zsh as default shell for $USERNAME..."
# Set zsh as the default shell
usermod -s /usr/bin/zsh "$USERNAME"

echo "Creating /etc/zsh/zshenv with ZDOTDIR configuration..."
# Create the directory if it doesn't exist
mkdir -p /etc/zsh

# Create /etc/zsh/zshenv with the ZDOTDIR environment variable
sudo tee /etc/zsh/zshenv >/dev/null <<EOF
export ZDOTDIR=/home/$USERNAME/.config/zsh
EOF

echo "✓ zsh installed"
echo "✓ zsh set as default shell for $USERNAME"
echo "✓ /etc/zsh/zshenv created with ZDOTDIR=/home/$USERNAME/.config/zsh"
