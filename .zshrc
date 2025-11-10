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
alias ls="ls -G"
alias ll="ls -lah"
alias ..="cd .."
alias ...="cd ../.."

# Docker aliases
alias d="docker"
alias dc="docker-compose"
alias dps="docker ps"
alias dimg="docker images"
alias dprune="docker system prune -af --volumes"

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

# Simple prompt (lightweight)
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

# Auto-complete
autoload -Uz compinit && compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
