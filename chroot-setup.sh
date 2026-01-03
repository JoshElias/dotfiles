#!/usr/bin/env bash

set -e

USERNAME="${1:-}"

if [ -z "$USERNAME" ]; then
  echo "Usage: $0 USERNAME"
  exit 1
fi

echo "Installing zsh package..."
# Install zsh from pacman
pacman -S --needed --noconfirm zsh

echo "Setting zsh as default shell for $USERNAME..."
# Set zsh as the default shell
usermod -s /usr/sbin/zsh "$USERNAME"

echo "Creating /etc/zsh/zshenv with ZDOTDIR configuration..."
# Create the directory if it doesn't exist
mkdir -p /etc/zsh

# Create /etc/zsh/zshenv with the ZDOTDIR environment variable
sudo tee /etc/zsh/zshenv >/dev/null <<EOF
export ZDOTDIR=/home/$USERNAME/.config/zsh
EOF

TARGET_DIR="/home/$USERNAME/.config/zsh"

if [ -f "./.zshenv" ]; then
  echo "Moving .zshenv to $TARGET_DIR..."

  # 1. Create the user's config directory if it doesn't exist
  mkdir -p "$TARGET_DIR"

  # 2. Move the file
  cp "./.zshenv" "$TARGET_DIR/.zshenv"

  # 3. FIX PERMISSIONS: Ensure the user owns the directory and the file
  # (Since this script runs as root, we must give ownership back to the user)
  chown -R "$USERNAME:$USERNAME" "$TARGET_DIR"
else
  echo "Warning: ./.zshenv not found in current directory. Skipping move."
fi

echo "✓ zsh installed"
echo "✓ zsh set as default shell for $USERNAME"
echo "✓ /etc/zsh/zshenv created with ZDOTDIR=/home/$USERNAME/.config/zsh"
if [ -f "$TARGET_DIR/.zshenv" ]; then
  echo "✓ Local .zshenv moved to $TARGET_DIR"
fi
