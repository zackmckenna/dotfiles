#!/bin/bash
# bootstrap.sh — set up a fresh machine from scratch
# Works on: macOS, Ubuntu/Debian (RunPod pods, Codespaces, VPS)
# Usage: curl -fsSL https://raw.githubusercontent.com/zackmckenna/dotfiles/main/bootstrap.sh | bash
# Or:    bash bootstrap.sh [--work] (--work also clones work dotfiles if OP_SERVICE_ACCOUNT_TOKEN is set)

set -e
DOTFILES_REPO="git@github-personal:zackmckenna/dotfiles.git"
DOTFILES_HTTPS="https://github.com/zackmckenna/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
WORK_DOTFILES_REPO="git@github.com:zackmckennarunpod/dotfiles-work.git"
WORK_DOTFILES_DIR="$HOME/dotfiles-work"
AGE_KEY="${AGE_KEY_FILE:-$HOME/.ssh/id_ed25519_personal}"
WITH_WORK=false
[[ "$*" == *"--work"* ]] && WITH_WORK=true

GREEN='\033[0;32m' YELLOW='\033[1;33m' BLUE='\033[0;34m' NC='\033[0m'
log()  { echo -e "${GREEN}✓${NC} $1"; }
info() { echo -e "${BLUE}→${NC} $1"; }
warn() { echo -e "${YELLOW}!${NC} $1"; }

OS="$(uname -s)"
info "Detected OS: $OS"

# ── 1. Package manager + core tools ──────────────────────────────────────────
if [[ "$OS" == "Darwin" ]]; then
  if ! command -v brew &>/dev/null; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  info "Installing core tools via Homebrew..."
  brew install git tmux neovim zoxide fzf bat eza fd starship gh direnv || true
  brew install --cask 1password-cli 2>/dev/null || brew install 1password-cli 2>/dev/null || true

elif [[ "$OS" == "Linux" ]]; then
  info "Installing core tools via apt..."
  apt-get update -qq 2>/dev/null || sudo apt-get update -qq
  APT="apt-get install -y -qq"
  command -v sudo &>/dev/null && APT="sudo apt-get install -y -qq"
  $APT git tmux curl wget unzip build-essential zsh

  # bun
  if ! command -v bun &>/dev/null; then
    info "Installing bun..."
    curl -fsSL https://bun.sh/install | bash
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
  fi

  # neovim (AppImage for consistent version)
  if ! command -v nvim &>/dev/null; then
    info "Installing neovim..."
    curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
      | tar xz -C /tmp && sudo mv /tmp/nvim-linux-x86_64 /opt/nvim
    sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
  fi

  # starship
  command -v starship &>/dev/null || curl -fsSL https://starship.rs/install.sh | sh -s -- -y

  # zoxide
  command -v zoxide &>/dev/null || curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

  # gh CLI
  if ! command -v gh &>/dev/null; then
    info "Installing gh CLI..."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      | sudo tee /etc/apt/sources.list.d/github-cli.list
    sudo apt-get update -qq && sudo apt-get install -y gh
  fi

  # 1Password CLI — optional, install manually if needed
  # https://developer.1password.com/docs/cli/get-started/
  if command -v op &>/dev/null; then
    log "1Password CLI already installed"
  else
    warn "1Password CLI not installed — secrets via age only (install op manually if needed)"
  fi

  # age encryption
  if ! command -v age &>/dev/null; then
    info "Installing age..."
    AGE_VERSION=$(curl -s https://api.github.com/repos/FiloSottile/age/releases/latest | grep tag_name | cut -d'"' -f4)
    curl -fsSL "https://github.com/FiloSottile/age/releases/latest/download/age-${AGE_VERSION}-linux-amd64.tar.gz" \
      | tar xz -C /tmp && sudo mv /tmp/age/age /usr/local/bin/age && sudo mv /tmp/age/age-keygen /usr/local/bin/age-keygen
    rm -rf /tmp/age
  fi
fi

log "Core tools ready"

# ── 2. Claude Code ────────────────────────────────────────────────────────────
if ! command -v claude &>/dev/null; then
  info "Installing Claude Code..."
  if command -v npm &>/dev/null; then
    npm install -g @anthropic-ai/claude-code
  elif command -v bun &>/dev/null; then
    bun install -g @anthropic-ai/claude-code
  else
    warn "No npm/bun found — install Claude Code manually after setup"
  fi
fi
command -v claude &>/dev/null && log "Claude Code ready" || warn "Claude Code not installed"

# ── 3. Clone personal dotfiles ────────────────────────────────────────────────
if [ ! -d "$DOTFILES_DIR/.git" ]; then
  info "Cloning personal dotfiles..."
  # Try SSH first (works if SSH key is set up), fall back to HTTPS
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR" 2>/dev/null \
    || git clone "$DOTFILES_HTTPS" "$DOTFILES_DIR"
  log "Dotfiles cloned"
else
  info "Dotfiles already present, pulling latest..."
  git -C "$DOTFILES_DIR" pull --rebase 2>/dev/null || true
fi

# ── 4. Symlink configs ────────────────────────────────────────────────────────
info "Linking config files..."
bash "$DOTFILES_DIR/install.sh"

# ── 5. Work dotfiles (age-encrypted secrets) ─────────────────────────────────
# Requires: SSH agent forwarding (ssh -A) or id_ed25519_personal present
if [ "$WITH_WORK" = true ]; then
  info "Setting up work dotfiles..."

  # Clone work dotfiles repo
  if [ ! -d "$WORK_DOTFILES_DIR/.git" ]; then
    info "Cloning work dotfiles..."
    git clone "$WORK_DOTFILES_REPO" "$WORK_DOTFILES_DIR" 2>/dev/null || {
      warn "Could not clone work dotfiles (SSH key not available?)"
      warn "To set up later: ssh -A into this machine and run: bash ~/dotfiles/bootstrap.sh --work"
    }
  else
    git -C "$WORK_DOTFILES_DIR" pull --rebase 2>/dev/null || true
  fi

  # Decrypt secrets if work dotfiles cloned and age key available
  if [ -d "$WORK_DOTFILES_DIR/.git" ] && command -v age &>/dev/null; then
    ENCRYPTED="$WORK_DOTFILES_DIR/work_secrets.age"
    if [ -f "$ENCRYPTED" ]; then
      age -d "$ENCRYPTED" > ~/.work_secrets && log "Secrets decrypted" || \
        warn "Could not decrypt secrets — run manually: age -d $ENCRYPTED > ~/.work_secrets"
      [ -f ~/.work_secrets ] && log "Work secrets ready (~/.work_secrets)"
    fi
  fi
fi

# ── 6. Oh My Zsh ─────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  log "Oh My Zsh installed"
fi

# ── 7. tmux session ──────────────────────────────────────────────────────────
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  info "Starting tmux session 'dev'..."
  tmux new-session -d -s dev 2>/dev/null || true
fi

# ── 8. Done ───────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Bootstrap complete!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "  Start shell:  exec zsh"
echo "  Attach tmux:  tmux attach -t dev"
[ -z "$OP_SERVICE_ACCOUNT_TOKEN" ] && \
  echo -e "  ${YELLOW}For work secrets: set OP_SERVICE_ACCOUNT_TOKEN and rerun with --work${NC}"
echo ""
