#!/usr/bin/env bash

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile inputrc"    # list of files/folders to symlink in homedir

gitdir=~/dotfiles/git
gitfiles="gitignore_global gitconfig"

echo $dir
echo $gitdir
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

for file in $gitfiles; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $gitdir/$file ~/.$file
done

########## Apply OSX Configuration Changes
source scripts/osxdefaults.sh
sudo chmod +x scripts/osxdefaults.sh

########## Install Applications
# source applications.sh

## Set up cronjob to do a daily brew update
#install new cron file
crontab mycrontab