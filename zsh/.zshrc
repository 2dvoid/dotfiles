
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Autocomplete
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Enable colors and change prompt:
# autoload -U colors && colors
#------------------------------DEFAULTS----------------------------------

# Most pager
export PAGER="most"

#------------------------------KEY BINDINGS-------------------------------

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Ctrl + left/right to skip words
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word 

# Ctrl + Backspace deletes whole word from left
bindkey '^H' backward-kill-word

# HOME,END key beginning/end of line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Delete key deletes from right
bindkey '^[[3~' delete-char

# Alt + backspace deletes a line
bindkey '^[^?' backward-kill-line

#-------------------------------------------------------------------------

#-----------------------------PLUGINS n THEMES----------------------------

# Prompt
fpath+=$HOME/.config/zsh/theme/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# Prompt Layout
#export TYPEWRITTEN_PROMPT_LAYOUT="pure"

# Auto suggestions plugin
source ~/.config/zsh/plugin/zsh-autosuggestions.zsh

# Sudo Plugin
source ~/.config/zsh/plugin/sudo.sh

# Dirhistory plugin
source ~/.config/zsh/plugin/dirhistory.sh

# Syntex highlighting plugin
source ~/.config/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.sh

#---------------------------------------------------------------------------

#--------------------------------Alias--------------------------------------

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i" 
alias rm='rm -I'
alias cl='clear'
alias sshon='sudo systemctl start sshd'
alias sshoff='sudo systemctl stop sshd'
alias rcloneg='rclone rcd --rc-web-gui'
#---------------------------------------------------------------------------
