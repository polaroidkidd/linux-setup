#!/bin/sh
set -e
# Update & Upgrade
sudo apt update
sudo apt upgrade -y


# Do all work in the tmp directory
cd /tmp

# Clone this repository
git clone https://github.com/polaroidkidd/linux-setup.git
cd linux-setup
git checkout feature/add-git-submodules
git submodule update --init --recursive


# get the path to this script
WORK_PATH=`dirname "$0"`
WORK_PATH=`( cd "$WORK_PATH" && pwd )`


# i3 & i3-gaps
sudo apt install -y xorg i3 i3lock-fancy xserver-xorg xutils-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake 

cd $WORK_PATH/xcb-util-xrm
git submodule update --init --recursive 
./autogen.sh --prefix=/usr
sudo make install

# i3
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

cd $WORK_PATH/i3
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# Compton
sudo apt install -y asciidoc pkg-config make gcc libev-libevent-dev libdbus-1-dev libgl1-mesa-dev libgles2-mesa-dev libxcb-present-dev libxcb-sync-dev libxcb-damage0-dev libx11-xcb-dev libev4 libev-dev uthash-dev libxdg-basedir-dev libconfig-dev meson libx11-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-shape0-dev libxcb-xkb-dev pkg-config xcb-proto libxcb-xrm-dev libxcb-composite0-dev xcb libxcb-ewmh2 libxcb1-dev libxcb-keysyms1-dev libxcb-util0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcomposite-dev libxrandr-dev libxinerama-dev make cmake automake autoconf xdotool
cd $WORK_PATH/compton
make
make docs
sudo make install

# Light
mkdir -p $WORK_PATH/light
cd $WORK_PATH/light
wget https://github.com/haikarainen/light/releases/download/v1.2/light-1.2.tar.gz
tar xf light-1.2.tar.gz 
cd light-1.2 
./configure 
make
sudo make install

# Network-Manager
cd $WORK_PATH
sudo apt install -y network-manager network-manager-config-connectivity-ubuntu network-manager-gnome

sudo cp $WORK_PATH/network-manager/globally-managed-devices.conf /usr/lib/NetworkManager/conf.d/globally-managed-devices.conf

# Fusuma
sudo gpasswd -a $USER input
sudo apt install -y libinput-tools ruby
sudo gem install fusuma

# Etra Tools
sudo apt install -y rofi ranger terminator

# Copy dot-files
mkdir ~/.config/
cp -r $WORK_PATH/dot-files/* ~/.config/


# Copy Intel Driver
sudo mkdir -p /usr/share/X11/xorg.conf.d/
sudo cp $WORK_PATH/dot-files/intel/20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf

# zsh
sudo apt install -y zsh
echo "y" | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp $WORK_PATH/dot-files/oh-my-zsh/.zshrc ~/.zshrc

# polybar
sudo add-apt-repository -y ppa:kgilmer/speed-ricer
sudo apt update
sudo apt install -y polybar

# wallpaper
sudo apt install -y feh
cp $WORK_PATH/assets/mountains.jpg ~/.config/i3/