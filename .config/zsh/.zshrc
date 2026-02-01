## Load Compinit
autoload -U compinit; compinit

# Initialize Sheldon Plugin Manager
eval "$(sheldon source)"

## Setup Ruby Dev Environment
eval "$(rbenv init -)"

# Stop Terminal Freezing on ctrl+s
stty -ixon

# -----------------------------
# History Configuration
# -----------------------------

# Use XDG_CACHE_HOME if available, otherwise default to ~/.cache
XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

# Ensure the directory exists (optional safety net)
if [[ ! -d "$XDG_CACHE_HOME/zsh" ]]; then
  mkdir -p "$XDG_CACHE_HOME/zsh"
fi

# Set the file path
HISTFILE="$XDG_CACHE_HOME/zsh/history"

# History behaviors
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
#-----------------------------

# Set default editor based on the environment
if [ -n "$SWAYSOCK" ]; then
    # We are in Sway, so use the graphical editor
    export VISUAL='neovide'
    export EDITOR='neovide'
else
    # We are in a TTY or other environment, use the terminal editor
    export VISUAL='nvim'
    export EDITOR='nvim'
fi

# XAMPP Aliases
alias dbup='sudo /opt/lampp/lampp start'
alias dbdown='sudo /opt/lampp/lampp stop'
alias dbrestart='sudo /opt/lampp/lampp restart'
alias mysqlup='/opt/lampp/bin/mysql -u root -p'


## Fzf Pluging Configs
# Disable the default standardized sort (let fzf handle it)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# PREVIEW SECTION: This is the game changer.
# When you tab on a directory (cd, z, etc.), show its contents (using eza or ls)
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# When you tab on a file (cat, nvim, etc.), show the file content
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
# Switch to standard "reverse" layout (list starts at top, grows down)
# This feels more natural for a drop-down menu
zstyle ':fzf-tab:*' fzf-flags --height=40% --layout=reverse
# Use the same keybindings as your Vim/Neovim setup for navigating the list
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:down,ctrl-k:up,ctrl-d:preview-page-down,ctrl-u:preview-page-up'
# The critical flag is --color=always
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --style=numbers --line-range=:500 $realpath'
# Load default colors for file types (directories blue, scripts green, etc.)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

## Setup zoxide
eval "$(zoxide init zsh)"

## Setup Starship Prompt
eval "$(starship init zsh)"
