# ----- Locale (must be BEFORE instant prompt) -----
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ----- Powerlevel10k Instant Prompt (keep near top) -----
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----- Node.js (nvm) -----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# ----- Oh My Zsh Path -----
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ----- Plugins -----
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

# ----- Load Oh My Zsh -----
source $ZSH/oh-my-zsh.sh

# ----- Completion Settings -----
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ----- History Settings -----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# ----- Shell Behavior -----
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CORRECT
setopt EXTENDED_GLOB
bindkey -v  # Enable vim mode

# ----- Aliases -----
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# ----- Preferred Editor -----
export EDITOR='vim'

# ----- Custom Paths -----
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# ----- Powerlevel10k Config -----
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
