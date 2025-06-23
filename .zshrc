# ====== Environment Setup ======
# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Docker
export DOCKER_BUILDKIT=1

# Python
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

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
add_path() {
  local dir="$1"
  if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
    PATH="$dir:$PATH"
  fi
}

add_path "$HOME/bin"
add_path "$HOME/.local/bin"
add_path "/usr/local/bin"
add_path "$HOME/.pyenv/bin"
add_path "$HOME/.cargo/bin"

export PATH

# ====== Aliases ======
if [ -f "$HOME/.zsh_aliases" ]; then
  source "$HOME/.zsh_aliases"
fi

# ====== Proxy Toggle Function ======
proxy() {
  local mode=$1
  local host="127.0.0.1"
  local port="7890"

  case "$mode" in
    on)
      export http_proxy="http://$host:$port"
      export https_proxy="http://$host:$port"
      export HTTP_PROXY="http://$host:$port"
      export HTTPS_PROXY="http://$host:$port"
      export ALL_PROXY="socks5://$host:$port"
      echo "Proxy enabled on $host:$port"
      ;;
    off)
      unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY
      echo "Proxy disabled"
      ;;
    status)
      if [[ -n "$http_proxy" ]]; then
        echo "Proxy is currently ENABLED:"
        echo "http_proxy=$http_proxy"
        echo "https_proxy=$https_proxy"
        echo "ALL_PROXY=$ALL_PROXY"
      else
        echo "Proxy is currently DISABLED"
      fi
      ;;
    *)
      echo "Usage: proxy {on|off|status}"
      ;;
  esac
}

# ====== Starship Theme =====
eval "$(starship init zsh)"
