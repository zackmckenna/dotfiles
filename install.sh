#!/bin/bash
set -e

echo "Setting up dotfiles..."

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.docker

# Backup existing configs
backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

if [ -f ~/.tmux.conf ]; then
    echo "Backing up existing .tmux.conf"
    mv ~/.tmux.conf "$backup_dir/"
fi

if [ -f ~/.gitignore_global ]; then
    echo "Backing up existing .gitignore_global"
    mv ~/.gitignore_global "$backup_dir/"
fi

if [ -d ~/.config/nvim ]; then
    echo "Backing up existing nvim config"
    mv ~/.config/nvim "$backup_dir/"
fi

# Create symlinks
echo "Creating symlinks..."
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/docker/daemon.json ~/.docker/daemon.json

# Copy Neovim config
echo "Setting up Neovim..."
cp -r ~/dotfiles/nvim ~/.config/nvim

echo ""
echo "✓ Dotfiles installed successfully!"
echo ""
echo "Next steps:"
echo "1. Remap Caps Lock to Control in System Settings > Keyboard > Modifier Keys"
echo "2. Open Docker Desktop and configure resource limits (Settings > Resources)"
echo "3. Launch Neovim to install plugins: nvim"
echo ""
