# If not running interactively, don't do anything
#!/usr/bin/env bash

[ -z "$PS1" ] && return

# OS
if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# Resolve DOTFILES_DIR
CURRENT_SCRIPT=$BASH_SOURCE

if [ -d "$HOME/dotfiles" ]; then
    DOTFILES_DIR="$HOME/dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    return # `exit 1` would quit the shell itself
fi

# Finally we can source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{path,env,private_env,alias,prompt}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,private_env,alias,prompt}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi
#
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#     source $(brew --prefix)/etc/bash_completion
# fi

# Clean up
unset CURRENT_SCRIPT DOTFILE

# Export
export OS DOTFILES_DIR

# Virtualenv
source /usr/local/bin/virtualenvwrapper.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

echo "Let's go!"
