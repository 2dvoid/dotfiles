# =============================================================================
# MINIMAL ZSH CONFIGURATION
# Pure, bloat-free, and intuitively structured.
# =============================================================================

# --- HISTORY --------------------------------------------------------------

# Use XDG_CACHE_HOME if available, otherwise default to ~/.cache
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

# Ensure the directory exists (optional safety net)
if [[ ! -d "$XDG_CACHE_HOME/zsh" ]]; then
  mkdir -p "$XDG_CACHE_HOME/zsh"
fi

# Set the file path
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY          # Append to the history file, don't overwrite it
setopt SHARE_HISTORY           # Share history across multiple open terminal tabs
setopt HIST_IGNORE_ALL_DUPS    # Keep the history clean by dropping duplicate commands
setopt HIST_REDUCE_BLANKS      # Remove unnecessary whitespace from history entries

# --- COMPLETION -----------------------------------------------------------
# Initialize Zsh's built-in completion system
autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/.zcompdump"

# Enable an intuitive, navigable menu for tab completions
zstyle ':completion:*' menu select

# Colorize the completion output automatically
zstyle ':completion:*' list-colors ''

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# --- 3. SANE DEFAULTS --------------------------------------------------------
setopt AUTO_CD                 # Change directory simply by typing its name (no 'cd' needed)
setopt INTERACTIVE_COMMENTS    # Allow the use of '#' to write comments in the prompt
setopt NO_BEEP                 # Disable terminal beeps to maintain a quiet environment


# --- PROMPT ---------------------------------------------------------------

#Vi mode
bindkey -v
export KEYTIMEOUT=15

# Map 'jk' to switch from insert mode to normal mode
bindkey -M viins 'jk' vi-cmd-mode

# Prompot design
autoload -U colors && colors

function zle-line-init zle-keymap-select {
    local MODE_INDICATOR
    
    if [[ $KEYMAP == vicmd ]]; then
        # Normal Mode: Red '>' and a solid block cursor (\e[2 q)
        MODE_INDICATOR="%{$fg_bold[red]%}<%{$reset_color%}"
        echo -ne '\e[2 q'
    else
        # Insert Mode: Green '>' and a vertical line cursor (\e[6 q)
        MODE_INDICATOR="%{$fg_bold[green]%}>%{$reset_color%}"
        echo -ne '\e[6 q'
    fi

    # PROMPT STRUCTURE:
    # %3~    : Shows the directory path, trimmed to only the last 3 levels
    # $'\n'  : Drops the input indicator to a fresh, clean second line
    PROMPT="%{$fg[blue]%}%3~%{$reset_color%}"$'\n'"$MODE_INDICATOR "
    
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select



# --- ALIASES --------------------------------------------------------------
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias la='ls -lAh'
alias c='clear'
alias v='nvim'


## --- Custom Functions ------------------------------------------------------

# Yazi 
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
