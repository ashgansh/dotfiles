# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export GIT_CONFIG="$HOME/.gitconfig"

# Custom scripts
source "$HOME/.custom/toolbox.zsh"



# Theme & Plugins
ZSH_THEME="geoffgarside"

plugins=(
  zsh-autosuggestions
  history-substring-search
  npm
  git
  docker
  docker-compose
  pip
  python
  autopep8
  gpg-aggent
  ssh-agent
  vi-mode
  history
)

# User configuration
export PATH="/sbin/:/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Command history
setopt share_history
unsetopt histverify

# Seemless gpg editing with VIM
GPG_TTY=`tty` 
export GPG_TTY

# VI keybindings
bindkey -v
export KEYTIMEOUT=1

# change cursor color basing on vi mode
INSERT_PROMPT="#637B86"
COMMAND_PROMPT="#3C8AE6"

set_prompt_color() {
  if [[ $TERM = "linux" ]]; then
    # nothing
  elif [[ $TMUX != '' ]]; then
    printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
  else
    echo -ne "\033]12;$1\007"
  fi
}

zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
  set_prompt_color $COMMAND_PROMPT
else
  set_prompt_color $INSERT_PROMPT
fi
}

zle-line-finish() {
set_prompt_color $INSERT_PROMPT
}

zle-line-init () {
zle -K viins
set_prompt_color $INSERT_PROMPT
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

#
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# startx at start
[[ -z $DISPLAY && $XDG_VTNR -eq 1  ]] && exec startx

# Prevent ctrl-s to freeze tty
stty -ixon

export PANEL_FIFO="/tmp/panel-fifo"
