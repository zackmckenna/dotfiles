# Dotfiles

Lightweight macOS development environment configuration.

## What's Included

- **tmux**: Terminal multiplexer with Caps Lock as prefix key
- **Neovim**: LazyVim configuration for modern editing
- **Git**: GitHub best practices configuration
- **Docker**: Low memory usage settings

## Installation

```bash
# Clone this repo
git clone https://github.com/zackmckenna/dotfiles.git ~/dotfiles

# Create symlinks
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/docker/daemon.json ~/.docker/daemon.json

# Copy Neovim config
cp -r ~/dotfiles/nvim ~/.config/nvim
```

## Prerequisites

Install required packages via Homebrew:

```bash
brew install tmux neovim ripgrep fd fzf gh
brew install --cask docker
```

## tmux

- Prefix: `Ctrl+A` (remap Caps Lock to Control in System Settings)
- Split horizontal: `Ctrl+A |`
- Split vertical: `Ctrl+A -`
- Vim-style pane navigation: `Ctrl+A h/j/k/l`
- Reload config: `Ctrl+A r`

## Neovim

LazyVim starter configuration. First launch will install plugins automatically.

## Git

Configured for GitHub with:
- Default branch: `main`
- Editor: `nvim`
- Global gitignore for macOS/editor files
- Reuse recorded resolution (rerere) enabled

## Docker

Configured for low memory usage with BuildKit enabled and garbage collection.

### Docker Desktop Settings

After installing Docker Desktop, configure resource limits:
1. Open Docker Desktop
2. Go to Settings → Resources
3. Set Memory: 4GB (or lower based on needs)
4. Set CPUs: 2-4
5. Set Disk image size: 32GB

## System Setup

### Remap Caps Lock to Control

1. Open System Settings
2. Go to Keyboard → Keyboard Shortcuts → Modifier Keys
3. Set Caps Lock to Control

This makes `Ctrl+A` (tmux prefix) much more ergonomic.
