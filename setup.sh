#!/usr/bin/env bash
set -e
set -x
# Update Packages
sudo apt update && sudo apt upgrade -y

# brave
# sudo apt install -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

#speed ricer
sudo add-apt-repository -y ppa:kgilmer/speed-ricer
wait

# nextcloud
sudo add-apt-repository -y ppa:nextcloud-devs/client
wait

sudo apt update && sudo apt upgrade -y

# Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -




# Do all work in the tmp directory
# Clone this repository
TEMP_WORK_DIR=/tmp/linux-setup
if [ ! -d "$TEMP_WORK_DIR" ]; then
  cd /tmp
  git clone https://github.com/polaroidkidd/linux-setup.git
fi
# Init Submodules
cd /tmp/linux-setup
git checkout fix/ubuntu-20.04-install-script-fixes
git submodule update --init --recursive

# update permissions
cd ..
sudo chmod -R a+rw linux-setup
cd linux-setup

# get the path to this script
WORK_PATH=$(dirname "$0")
WORK_PATH=$( (cd "$WORK_PATH" && pwd))
SUBMODULE_PATH=$WORK_PATH/Submodules


# install everyting
sudo apt install -y  \
                      apt-transport-https \
                      curl \
                      make \
                      xorg \
                      i3 \
                      i3lock-fancy \
                      xserver-xorg \
                      xutils-dev \
                      libxcb1-dev \
                      libxcb-keysyms1-dev \
                      libpango1.0-dev \
                      libxcb-util0-dev \
                      libxcb-icccm4-dev \
                      libyajl-dev \
                      libstartup-notification0-dev \
                      libxcb-randr0-dev \
                      libev-dev \
                      libxcb-cursor-dev \
                      libxcb-xinerama0-dev \
                      libxcb-xkb-dev \
                      libxkbcommon-dev \
                      libxkbcommon-x11-dev \
                      autoconf \
                      xutils-dev \
                      libtool \
                      automake \
                      libxcb1-dev \
                      libxcb-keysyms1-dev \
                      libpango1.0-dev \
                      libxcb-util0-dev \
                      libxcb-icccm4-dev \
                      libyajl-dev \
                      libstartup-notification0-dev \
                      libxcb-randr0-dev \
                      libev-dev \
                      libxcb-cursor-dev \
                      libxcb-xinerama0-dev \
                      libxcb-xkb-dev \
                      libxkbcommon-dev \
                      libxkbcommon-x11-dev \
                      autoconf \
                      libxcb-xrm0 \
                      libxcb-xrm-dev \
                      automake \
                      libxcb-shape0-dev \
                      asciidoc \
                      pkg-config \
                      make \
                      gcc \
                      libev-libevent-dev \
                      libdbus-1-dev \
                      libgl1-mesa-dev \
                      libgles2-mesa-dev \
                      libxcb-present-dev \
                      libxcb-sync-dev \
                      libxcb-damage0-dev \
                      libx11-xcb-dev \
                      libev4 \
                      libev-dev \
                      uthash-dev \
                      libxdg-basedir-dev \
                      libconfig-dev \
                      meson \
                      libx11-dev \
                      libxcb1-dev \
                      libxcb-ewmh-dev \
                      libxcb-icccm4-dev \
                      libxcb-image0-dev \
                      libxcb-randr0-dev \
                      libxcb-util0-dev \
                      libxcb-shape0-dev \
                      libxcb-xkb-dev \
                      pkg-config \
                      xcb-proto \
                      libxcb-xrm-dev \
                      libxcb-composite0-dev \
                      xcb \
                      libxcb-ewmh2 \
                      libxcb1-dev \
                      libxcb-keysyms1-dev \
                      libxcb-util0-dev \
                      libxcb-randr0-dev \
                      libev-dev \
                      libxcb-cursor-dev \
                      libxcb-xinerama0-dev \
                      libxcomposite-dev \
                      libxrandr-dev \
                      libxinerama-dev \
                      make \
                      cmake \
                      automake \
                      autoconf \
                      xdotool \
                      libxdamage-dev \
                      libdrm-dev \
                      libinput-tools \
                      ruby \
                      ranger \
                      terminator \
                      plymouth-themes \
                      polybar \
                      feh \
                      apt-transport-https \
                      code \
                      pulseaudio \
                      pulseaudio-module-bluetooth \
                      pulseaudio-utils \
                      pavucontrol \
                      pasystray \
                      blueman \
                      bluez \
                      bluez-obexd \
                      bluez-tools \
                      libbluetooth3 \
                      apt-transport-https \
                      curl \
                      brave-browser \
                      brave-keyring \
                      firefox \
                      nextcloud-client \
                      copyq \
                      keepassx \
                      network-manager \
                      network-manager-config-connectivity-ubuntu \
                      network-manager-gnome \
                      network-manager-openvpn \
                      network-manager-openvpn-gnome \
                      zsh \
                      thunar \
                      thunar-archive-plugin \
                      thunar-data \
                      thunar-media-tags-plugin \
                      thunar-vcs-plugin \
                      thunar-volman \
                      google-cloud-sdk

# i3 & i3-gaps
# sudo apt install -y
cd $SUBMODULE_PATH/xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr --disable-dependency-tracking
make
sudo make install


# i3
# sudo apt install -y

cd $SUBMODULE_PATH/i3
git checkout gaps-next
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# Compton
# sudo apt install -y
cd $SUBMODULE_PATH/compton
make
make docs
sudo make install

# Light
mkdir -p $SUBMODULE_PATH/light
cd $WORK_PATH/light
wget https://github.com/haikarainen/light/releases/download/v1.2/light-1.2.tar.gz
tar xf light-1.2.tar.gz
cd light-1.2
./configure
make
sudo make install

# Fusuma
sudo gpasswd -a $USER input
# sudo apt install -y
sudo gem install fusuma

# Extra Tools
# sudo apt install -y

# rofi
sudo apt -y remove meson # not needed because we're using the latest python implementation
# rm -rf ./rofi
# git clone --recursive https://github.com/davedavenport/rofi.git
cd $SUBMODULE_PATH/rofi
sudo apt-get -y install python3 python3-pip python3-setuptools python3-wheel ninja-build librsvg2-dev libjpeg-dev flex bison check libpango1.0-dev libpangocairo-1.0-0 libcairo2-dev libglib2.0-dev libstartup-notification0-dev libxkbcommon-dev libxcb1-dev doxygen doxygen uncrustify cppcheck ohcount ronn
sudo pip3 install meson==0.54
sudo meson setup build
sudo ninja -C build
sudo ninja -C build install
mkdir -p ~/.config/rofi
cp -r $WORK_PATH/dot-files/rofi ~/.config/rofi



# plymouth
cd $SUBMODULE_PATH/plymouth-themes
# sudo apt install -y
sudo cp -r pack_2/dark_planet /usr/share/plymouth/themes
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/dark_planet/dark_planet.plymouth 100
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u
cd $WORK_PATH

# Copy dot-files
mkdir -p ~/.config/
cp -r $WORK_PATH/dot-files/* ~/.config/
mkdir -p ~/.local/share/applications/
cp -r $WORK_PATH/desktop-entries/* ~/.local/share/applications/

# Install Intel/DisplayPort Driver
sudo mkdir -p /usr/share/X11/xorg.conf.d/
sudo cp $WORK_PATH/dot-files/intel/20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf
sudo cp $WORK_PATH/DisplayDriver/20-evdidevice.conf /usr/share/X11/xorg.conf.d/20-evdidevice.conf
cd $WORK_PATH/DisplayDriver/
sudo chmod +x ./displaylink-driver-5.3.1.34.run
sudo ./displaylink-driver-5.3.1.34.run


# polybar
# sudo apt install -y

# wallpaper
# sudo apt install -y

# VS Code
# sudo apt install -y

# pulse audio
# sudo apt install -y

# bluetooth
# sudo apt install -y

# Brave Browser
# sudo apt install -y

# FireFox
# sudo apt install -y

# Intellij
mkdir -p ~/DevTools/IntelliJ
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.17.7275.tar.gz
tar xzvf jetbrains-toolbox-1.17.7275.tar.gz -C ~/DevTools/IntelliJ

# nextcloud
# sudo apt install -y

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Spotify
sudo apt -y install spotify-client

# github cli
sudo snap install hub --classic

# google chrome
cd $WORK_PATH
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# CopyQ
# sudo apt install -y

# keepassX
# sudo apt install -y

# Install Fonts
unzip $WORK_PATH/Roboto_Mono.zip -d ${HOME}/.fonts
cp -r $WORK_PATH/dot-files/polybar/fonts ${HOME}/.fonts

# enable bitmap fonts
FILE=/etc/fonts/conf.d/70-no-bitmaps.conf
if test -f "$FILE"; then
  sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
fi
sudo fc-cache -f -v

# Docker
sudo apt remove --yes docker docker-engine docker.io &&
  sudo apt update &&
  sudo apt --yes --no-install-recommends install \
    apt-transport-https \
    ca-certificates &&
  wget --quiet --output-document=- https://download.docker.com/linux/ubuntu/gpg |
  sudo apt-key add - &&
  sudo add-apt-repository \
    "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu \
        $(lsb_release --codename --short) \
        stable" &&
  sudo apt update &&
  sudo apt --yes --no-install-recommends install docker-ce &&
  sudo usermod --append --groups docker "$USER" &&
  sudo systemctl enable docker &&
  printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 3

# Docker Compose
sudo wget \
  --output-document=/usr/local/bin/docker-compose \
  https://github.com/docker/compose/releases/download/1.25.0/run.sh &&
  sudo chmod +x /usr/local/bin/docker-compose &&
  sudo wget \
    --output-document=/etc/bash_completion.d/docker-compose \
    "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose" &&
  printf '\nDocker Compose installed successfully\n\n'

# Network-Manager
cd $WORK_PATH
# sudo apt install -y
if [[ -f /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf ]]; then
  sudo rm /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
fi

if [[ -f /etc/network/interfaces ]]; then
  sudo rm /etc/network/interfaces
fi
sudo cp $WORK_PATH/network-manager/interfaces /etc/network/interfaces
sudo touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
sudo cp $WORK_PATH/network-manager/01-netcfg.yaml /etc/netplan/01-netcfg.yaml
# sudo apt install -y

# zsh
# sudo apt install -y
echo "y" | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s /usr/bin/zsh root
sudo chsh -s /usr/bin/zsh $USER

# google cloud cli
# Add the Cloud SDK distribution URI as a package source

# sdk man
curl -s "https://get.sdkman.io" | bash

# fonts
# cd $WORK_PATH
cd $WORK_PATH
# git clone https://github.com/ryanoasis/nerd-fonts.git
cd $SUBMODULE_PATH/nerd-fonts
bash ./install.sh
cd $WORK_PATH
# thunar
# sudo apt install -y

# Space Theme
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/themes/spaceship-prompt
ln -s ~/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

# ZSH Auto-Complete Suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ZSH Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp $WORK_PATH/dot-files/oh-my-zsh/.zshrc ~/.zshrc

# handle emojis (disabled)
echo "run_im xim" >~/.xinputrc

# launch code with support for `ctrl+shift+e`
sudo cp $WORK_PATH/desktop-entries/code.desktop /usr/share/applications/code.desktop
sudo apt remove -y gnome-desktop3-data


set +x
# Complete
echo "Installation Completed! Don't forget to set the grub screen to 'splash' and update the dark_planat.plymouth theme!"

