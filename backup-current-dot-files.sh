#!/usr/bin/env bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

# Define dot-file dir
DOTFILE_PATH=$MY_PATH/dot-files

echo $DOTFILE_PATH

# Delete Previous dot-files
rm -rf $DOTFILE_PATH
mkdir $DOTFILE_PATH

mkdir -p $DOTFILE_PATH/rofi
mkdir -p $DOTFILE_PATH/i3
mkdir -p $DOTFILE_PATH/fusuma
mkdir -p $DOTFILE_PATH/polybar
mkdir -p $DOTFILE_PATH/terminator

cp ~/.config/i3/config $DOTFILE_PATH/i3/
cp ~/.config/rofi/rofi.sh $DOTFILE_PATH/rofi/rofi.sh
cp ~/.config/fusuma/config.yml $DOTFILE_PATH/fusuma/
cp ~/.config/compton.conf $DOTFILE_PATH
cp -r ~/.config/copyq $DOTFILE_PATH/
cp -r ~/.config/polybar $DOTFILE_PATH/
cp -r ~/.config/terminator $DOTFILE_PATH/

# custom desktop entries
rm -rf desktop-entries
mkdir desktop-entries
sudo cp ~/.local/share/applications/whatsapp.desktop ./desktop-entries/
sudo cp ~/.local/share/applications/telegram.desktop ./desktop-entries/
sudo cp ~/.local/share/applications/plex.desktop ./desktop-entries/
sudo cp ~/.local/share/applications/spotify.desktop ./desktop-entries/
sudo cp /usr/share/applications/code.desktop ./desktop-entries/

# oh-my-zsh
mkdir -p $DOTFILE_PATH/oh-my-zsh
cp ~/.zshrc $DOTFILE_PATH/oh-my-zsh

# intel graphics
mkdir -p $DOTFILE_PATH/intel
sudo cp /usr/share/X11/xorg.conf.d/20-intel.conf $DOTFILE_PATH/intel/20-intel.conf

# git-config
rm -rf ./git-config/
mkdir -p ./git-config
cp ~/.gitconfig ./git-config/
cp ~/.gitconfig-me ./git-config/
cp ~/.gitconfig-ti8m ./git-config/