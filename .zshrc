# Zsh Configuration

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# Git aliases
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"
alias glog="git log --oneline --graph --decorate"

# tmux aliases
alias t="tmux"
alias ta="tmux attach"
alias tn="tmux new -s"
alias tl="tmux list-sessions"

# Common shortcuts
alias vim="nvim"
alias vi="nvim"
alias ls="eza --icons=always"
alias ll="eza -lah --icons=always"
alias la="eza -la --icons=always"
alias lt="eza --tree --level=2 --icons=always"
alias cat="bat"
alias ..="cd .."
alias ...="cd ../.."

# Docker aliases
alias d="docker"
alias dc="docker-compose"
alias dps="docker ps"
alias dimg="docker images"
alias dprune="docker system prune -af --volumes"
alias lzd="lazydocker"

# Lazygit
alias lg="lazygit"

# GitHub CLI
alias pr="gh pr"
alias issue="gh issue"

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Enable colors
autoload -U colors && colors

# Auto-complete
autoload -Uz compinit && compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Zoxide (smarter cd)
eval "$(zoxide init zsh)"
alias cd="z"

# Starship prompt (beautiful and fast)
eval "$(starship init zsh)"

# direnv hook (load environment variables from .envrc)
eval "$(direnv hook zsh)"

# thefuck alias (correct previous command)
eval $(thefuck --alias)

# Node.js / npm
export PATH="$HOME/.npm-global/bin:$PATH"

# Useful aliases for new tools
alias http="httpie"
alias preview="glow"
alias help="tldr"
alias top="htop"

# jq aliases for common operations
alias jqp="jq -C . | less -R"  # Pretty print and page JSON

# ni package manager wrapper (@antfu/ni)
# Automatically uses the right package manager (npm/yarn/pnpm)

# Zsh plugins (load last)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PARA shortcuts
alias para='open ~/Documents/PARA'
alias servers='code ~/Documents/PARA/Areas/Infrastructure/Servers.md'

# uv tools
export PATH="$HOME/.local/bin:$PATH"
