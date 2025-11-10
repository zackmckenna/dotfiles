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
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -sf ~/dotfiles/docker/daemon.json ~/.docker/daemon.json
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

# Copy Neovim config
echo "Setting up Neovim..."
cp -r ~/dotfiles/nvim ~/.config/nvim

# Karabiner-Elements (if installed)
if [ -d "/Applications/Karabiner-Elements.app" ]; then
    echo "Setting up Karabiner-Elements..."
    mkdir -p ~/.config/karabiner
    ln -sf ~/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
    ln -sf ~/dotfiles/karabiner/assets ~/.config/karabiner/assets
else
    echo "⚠️  Karabiner-Elements not found. Install it for dual-function Caps Lock."
fi

echo ""
echo "✓ Dotfiles installed successfully!"
echo ""
echo "Next steps:"
echo "1. Install Karabiner-Elements: brew install --cask karabiner-elements"
echo "2. Grant Karabiner permissions in System Settings > Privacy & Security"
echo "3. Open Docker Desktop and configure resource limits (Settings > Resources)"
echo "4. Launch WezTerm: open -a WezTerm"
echo "5. Reload shell: source ~/.zshrc"
echo ""
