#!/usr/bin/env bash

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# If not running interactively, don't do anything
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
for DOTFILE in "$DOTFILES_DIR"/system/.{path,env,private_env,alias}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,private_env,alias}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi


# Clean up
unset CURRENT_SCRIPT DOTFILE

# Export
export OS DOTFILES_DIR

# Virtualenv
# source /usr/local/bin/virtualenvwrapper.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

echo "Let's go!"
eval $(/usr/libexec/path_helper -s)
