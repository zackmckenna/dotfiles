#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/dotfiles"

echo -e "${GREEN}Setting up dotfiles...${NC}"

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo -e "${YELLOW}Backing up existing files to: $BACKUP_DIR${NC}"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    # If target exists and is not a symlink, back it up
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "  Backing up existing $target"
        mv "$target" "$BACKUP_DIR/"
    fi
    
    # Remove existing symlink if it exists
    if [ -L "$target" ]; then
        rm "$target"
    fi
    
    # Create new symlink
    ln -sf "$source" "$target"
    echo -e "${GREEN}✓${NC} Linked $source → $target"
}

# ZSH Configuration
echo -e "\n${YELLOW}Setting up ZSH...${NC}"
create_symlink "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"

# Alacritty Configuration
echo -e "\n${YELLOW}Setting up Alacritty...${NC}"
mkdir -p "$HOME/.config/alacritty"
create_symlink "$DOTFILES_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# Tmux Configuration
if [ -f "$DOTFILES_DIR/tmux/tmux.conf" ]; then
    echo -e "\n${YELLOW}Setting up Tmux...${NC}"
    create_symlink "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
fi

# Git Configuration
echo -e "\n${YELLOW}Setting up Git...${NC}"
create_symlink "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"

# Bin directory (scripts)
echo -e "\n${YELLOW}Setting up bin directory...${NC}"
mkdir -p "$HOME/bin"
for script in "$DOTFILES_DIR/bin"/*; do
    if [ -f "$script" ]; then
        script_name=$(basename "$script")
        create_symlink "$script" "$HOME/bin/$script_name"
        chmod +x "$HOME/bin/$script_name"
    fi
done

# Create .gitignore_global if it doesn't exist
if [ ! -f "$DOTFILES_DIR/git/gitignore_global" ]; then
    echo -e "\n${YELLOW}Creating global gitignore...${NC}"
    cat > "$DOTFILES_DIR/git/gitignore_global" << 'EOF'
# macOS
.DS_Store
.AppleDouble
.LSOverride
Icon
._*
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

# Vim
*.swp
*.swo
*~
.vim/

# VS Code
.vscode/
*.code-workspace

# JetBrains IDEs
.idea/
*.iml

# Node
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
.env

# Rust
target/
Cargo.lock
EOF
    create_symlink "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"
fi

echo -e "\n${GREEN}Dotfiles setup complete!${NC}"
echo -e "${YELLOW}Old files backed up to: $BACKUP_DIR${NC}"
echo -e "\n${GREEN}Next steps:${NC}"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Configure git user: git config --global user.name 'Your Name'"
echo "  3. Configure git email: git config --global user.email 'your@email.com'"
echo "  4. Push to GitHub: cd ~/dotfiles && git remote add origin <your-repo-url> && git push"