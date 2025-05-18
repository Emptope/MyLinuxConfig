# ====== Base Prompt Configuration ======
# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ====== Environment Setup ======
# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Python (pyenv)
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Node.js (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Proxy Settings
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890

# ====== Oh My Zsh & Plugins ======
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Completion Settings
autoload -Uz compinit
compinit
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

# ====== Powerlevel10k Config ======
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
