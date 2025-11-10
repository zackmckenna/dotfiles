# Dotfiles

Modern, lightweight macOS development environment with beautiful UI and icons.

## What's Included

### Terminal & Shell
- **WezTerm**: GPU-accelerated terminal emulator
- **Starship**: Beautiful, fast prompt with icons
- **Nerd Fonts**: JetBrains Mono with full icon support
- **zsh**: Enhanced with autosuggestions and syntax highlighting

### Development Tools
- **tmux**: Terminal multiplexer with Caps Lock as prefix
- **Neovim**: LazyVim configuration for modern editing
- **lazygit**: Terminal UI for git operations
- **lazydocker**: Terminal UI for Docker management

### Modern CLI Tools
- **eza**: Modern `ls` replacement with icons
- **bat**: Syntax-highlighted `cat` replacement
- **zoxide**: Smarter `cd` command (learns your habits)
- **git-delta**: Beautiful git diffs with syntax highlighting
- **btop**: System resource monitor
- **fzf**: Fuzzy finder for files and history
- **ripgrep**: Faster grep alternative

### Configuration
- **Karabiner-Elements**: Dual-function Caps Lock (tap=Esc, hold=Ctrl)
- **Git**: GitHub best practices with delta integration
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

Install all required packages via Homebrew:

```bash
# Terminal emulator and fonts
brew install --cask wezterm
brew install font-jetbrains-mono-nerd-font font-meslo-lg-nerd-font

# Core development tools
brew install tmux neovim gh git-delta

# Modern CLI tools
brew install lazygit lazydocker bat eza zoxide btop starship fzf ripgrep fd

# Shell enhancements
brew install zsh-autosuggestions zsh-syntax-highlighting

# Docker
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

### Dual-Function Caps Lock (Best of Both Worlds!)

Using **Karabiner-Elements**, Caps Lock is configured as:
- **Tap** Caps Lock alone → **Escape** (perfect for vim!)
- **Hold** Caps Lock + key → **Control** (perfect for tmux!)

This is the ultimate vim/tmux setup - no compromises!

#### Setup Karabiner-Elements

1. **Install** (requires admin password):
   ```bash
   brew install --cask karabiner-elements
   ```

2. **Grant permissions**:
   - Open System Settings → Privacy & Security
   - Allow Karabiner-Elements and karabiner_grabber

3. **Activate** (if using install.sh, this is automatic):
   - Open Karabiner-Elements
   - The dual-function Caps Lock rule should already be active
   - If not, go to Complex Modifications → Add rule → Enable "Caps Lock: Tap for Escape, Hold for Control"

4. **Test it**:
   - Tap Caps Lock → Should work as Escape (try in vim: `i` to insert, Caps Lock to exit)
   - Hold Caps Lock + A → Should work as Ctrl+A (tmux prefix)

**Why this is amazing:**
- `i` to enter insert mode, quick tap Caps Lock to exit (faster than reaching for Esc!)
- `Caps Lock + a` then `|` to split tmux pane
- `Caps Lock + c` to send interrupt signal
- All without moving your hands from home row!

## Quick Reference

### Modern CLI Aliases

```bash
# File navigation (with icons!)
ls              # Lists files with icons (eza)
ll              # Detailed list with icons
la              # All files including hidden
lt              # Tree view (2 levels deep)

# File viewing
cat file.txt    # Syntax-highlighted (bat)

# Smart navigation
cd project      # Jump to frequently used dirs (zoxide)

# Git
lg              # Open lazygit TUI
gs              # Git status
gd              # Git diff (with delta)

# Docker
lzd             # Open lazydocker TUI
dps             # Docker ps
dprune          # Clean up Docker resources

# System monitoring
btop            # Beautiful system monitor

# Tmux
t               # Start tmux
ta              # Attach to session
tn name         # New session with name
```

### Key Features

- **Auto-suggestions**: Start typing a command you've used before, it will suggest completion (gray text, press →)
- **Syntax highlighting**: Commands turn green if valid, red if not found
- **Smart cd**: `cd` remembers your most-used directories - just type part of the name
- **Beautiful git diffs**: Run `git diff` or `git log -p` to see syntax-highlighted diffs
- **Icons everywhere**: File icons in ls, git icons in prompt, language icons in starship

### WezTerm Shortcuts

- `Cmd+|`: Split pane horizontally
- `Cmd+_`: Split pane vertically
- `Cmd+h/j/k/l`: Navigate between panes (vim-style)
- `Cmd+w`: Close current pane

### Launch WezTerm

After setup, open WezTerm from Applications or run:
```bash
open -a WezTerm
```

All your configurations will be loaded automatically!
