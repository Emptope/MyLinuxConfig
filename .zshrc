# ====== Environment Setup ======
# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Docker
export DOCKER_BUILDKIT=1

# Python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Proxy Settings
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890
export ALL_PROXY=socks5://127.0.0.1:7890

# ====== Oh My Zsh & Plugins ======
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
plugins=(
    git 
    z 
    zsh-autosuggestions 
    fast-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Completion Settings
autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ====== Shell Behavior ======
setopt AUTO_CD
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS
setopt CORRECT EXTENDED_GLOB
bindkey -v  # vim mode

# ====== Preferred Editor ======
export EDITOR='nvim'

# ====== Custom Paths ======
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# ====== Aliases ======
if [ -f "$HOME/.zsh_aliases" ]; then
  source "$HOME/.zsh_aliases"
fi

# ====== Starship Theme =====
eval "$(starship init zsh)"
