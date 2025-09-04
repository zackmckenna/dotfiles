# Dotfiles

My personal configuration files for macOS.

## What's Included

- **ZSH** - Shell configuration with Oh My Zsh, aliases, and functions
- **Alacritty** - Terminal emulator configuration
- **Tmux** - Terminal multiplexer configuration
- **Git** - Global git configuration
- **Bin** - Personal scripts (like `fontswitch`)

## Installation

### Quick Install (New Machine)

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# Run the install script
cd ~/dotfiles
./install.sh

# Restart your terminal
```

### Manual Installation

If you prefer to manually link specific configs:

```bash
# ZSH
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# Alacritty
ln -sf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

# Tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Git
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
```

## Structure

```
dotfiles/
├── alacritty/          # Terminal emulator config
│   └── alacritty.toml
├── bin/                # Personal scripts
│   └── fontswitch
├── git/                # Git configuration
│   ├── gitconfig
│   └── gitignore_global
├── tmux/               # Tmux configuration
│   └── tmux.conf
├── zsh/                # ZSH configuration
│   └── zshrc
├── install.sh          # Installation script
└── README.md           # This file
```

## Updating

To update your dotfiles:

```bash
cd ~/dotfiles
git pull
./install.sh  # Re-run to ensure all links are correct
```

## Adding New Dotfiles

1. Copy the config file to the appropriate directory in `~/dotfiles`
2. Update `install.sh` to create the symlink
3. Commit and push changes

## Backup

The install script automatically backs up existing files before creating symlinks. Backups are stored in `~/.dotfiles_backup_[timestamp]/`.

## Requirements

- macOS
- [Homebrew](https://brew.sh/)
- Git
- ZSH (default on macOS)

## Optional Tools

The ZSH config works best with these tools installed:

```bash
brew install fzf fd ripgrep bat
```