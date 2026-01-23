
# Initialize Sheldon Plugin Manager
eval "$(sheldon source)"

## Setup Ruby Dev Environment
eval "$(rbenv init -)"

# Stop Terminal Freezing on ctrl+s
stty -ixon

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
