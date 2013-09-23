#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

DATE=$(date +"%Y%m%d%H%M%S")
DIR=$HOME/.vimfiles                    # dotfiles directory
DIR_BAK=$HOME/.vimfiles.bak             # old dotfiles backup directory
FILES="vimrc vim"    # list of files/folders to symlink in homedir


##########

# Fetch any git submodules
echo "- Checking Git submodules"
git submodule update --init

# create dotfiles_old in homedir
echo "- Creating backup directory $DIR_BAK/$DATE"
mkdir -p $DIR_BAK
mkdir -p $DIR_BAK/$DATE

# change to the dotfiles directory
cd $DIR

# move any existing dotfiles in homedir to dotfiles_old directory
echo "- Moving existing dotfiles to backup folder $DIR_BAK/$DATE"
for FILE in $FILES; do
    mv $HOME/.$FILE $DIR_BAK/$DATE
done

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "- Adding new dotfile symlinks $HOME"
for FILE in $FILES; do
    ln -s $DIR/$FILE $HOME/.$FILE
done
