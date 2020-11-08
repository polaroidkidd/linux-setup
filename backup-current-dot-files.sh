#!/usr/bin/env bash
set -e
set -x
# get the path to this script
WORK_PATH=`dirname "$0"`
WORK_PATH=`( cd "$WORK_PATH" && pwd )`

# Define dot-file dir
DOTFILE_PATH=$WORK_PATH/dot-files

echo $DOTFILE_PATH

cd $WORK_PATH
sudo chown -R $USER $DOTFILE_PATH
# Delete Previous dot-files
rm -rf $DOTFILE_PATH
mkdir $DOTFILE_PATH

mkdir -p $DOTFILE_PATH/i3
mkdir -p $DOTFILE_PATH/fusuma
mkdir -p $DOTFILE_PATH/polybar
mkdir -p $DOTFILE_PATH/icons
mkdir -p $DOTFILE_PATH/gnome-shell
mkdir -p $DOTFILE_PATH/themes
mkdir -p $DOTFILE_PATH/gtk
mkdir -p $DOTFILE_PATH/compton

cp ~/.config/i3/config $DOTFILE_PATH/i3/
cp -r ~/.config/rofi $DOTFILE_PATH/
cp ~/.config/fusuma/config.yml $DOTFILE_PATH/fusuma/
cp ~/.config/compton.conf $DOTFILE_PATH/compton/
cp -r ~/.config/copyq $DOTFILE_PATH/
cp -r ~/.config/polybar $DOTFILE_PATH/
cp -r ~/.config/gnome-shell $DOTFILE_PATH/
cp -r ~/.themes $DOTFILE_PATH/
cp ~/.gtkrc-3.0 $DOTFILE_PATH/gtk
cp ~/.gtkrc-2.0 $DOTFILE_PATH/gtk
cp -r ~/.config/gtk-2.0 $DOTFILE_PATH/gtk
cp -r ~/.config/gtk-3.0 $DOTFILE_PATH/gtk
cp -r ~/.config/gtk-2.0 $DOTFILE_PATH/gtk
cp -r ~/.config/gtk-assets $DOTFILE_PATH/gtk

# custom desktop entries
rm -rf desktop-entries
mkdir desktop-entries
sudo cp ~/.local/share/applications/whatsapp.desktop ./desktop-entries/
sudo cp ~/.local/share/applications/plex.desktop ./desktop-entries/
sudo cp ~/.local/share/applications/spotify.desktop ./desktop-entries/
sudo cp /usr/share/applications/code.desktop ./desktop-entries/

# oh-my-zsh
mkdir -p $DOTFILE_PATH/oh-my-zsh
cp ~/.zshrc $DOTFILE_PATH/oh-my-zsh

# intel graphics
mkdir -p $DOTFILE_PATH/intel
sudo cp -r /usr/share/X11/xorg.conf.d $DOTFILE_PATH/intel/

# git-config
rm -rf ./git-config/
mkdir -p ./git-config
cp ~/.gitconfig ./git-config/
cp ~/.gitconfig-me ./git-config/
cp ~/.gitconfig-ti8m ./git-config/

cd $WORK_PATH
sudo chown -R $USER $DOTFILE_PATH