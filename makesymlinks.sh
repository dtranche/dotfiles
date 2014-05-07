#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc emacs"
emacsdir=$dir/emacs_el_files
bashdir=$dir/environment/bash

emacssettings=$dir/my_settings

emacsfiles="cpp-font-lock.el custom-java-style.el grep-buffers.el package.el"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

settings="el-get-settings.el basic-settings.el custom-functions.el cpp-settings.el"
settingsdir=~/.emacs.d/settings
if  [ ! -d "$settingsdir" ]; then
    mkdir -p $settingsdir
fi
cd $settingsdir
for file in $settings; do
    ln -s $emacssettings/$file $settingsdir/$file
done

envdir=~/environment/emacs/
if  [ ! -d "$envdir" ]; then
    mkdir -p $envdir
fi

cd $emacsdir

for file in $emacsfiles; do
    echo "Creating symlink to $file in $emacsdir"
    ln -s $emacsdir/$file $envdir/$file
done

envdir=~/environment/bash/
if  [ ! -d "$envdir" ]; then
    mkdir -p $envdir
fi

cd $bashdir
for file in $bashdir/*; do
    ln -s $file $envdir
done

if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
fi

for file in ~/dotfiles/bin/*; do
    ln -s $file ~/bin
done

echo "done"
