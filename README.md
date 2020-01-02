Repo for dot-files and setup scripts for a fresh Ubuntu-Server installation


# i3-gaps
  * GitHub: 
  * Instructions: `sudo apt install xorg i3 i3lock-fancy xserver-xorg xutils-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake && git clone https://github.com/Airblader/xcb-util-xrm && cd xcb-util-xrm && git submodule update --init && ./autogen.sh --prefix=/usr && make sudo make install`

# TryOne-Compton
  * Dependencies
    `sudo apt install pkg-config make gcc libev-libevent-dev libdbus-1-dev libgl1-mesa-dev libgles2-mesa-dev libxcb-present-dev libxcb-sync-dev libxcb-damage0-dev libx11-xcb-dev libev4 libev-dev uthash-dev libxdg-basedir-dev libconfig-dev meson libx11-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-shape0-dev libxcb-xkb-dev pkg-config xcb-proto libxcb-xrm-dev libxcb-composite0-dev xcb libxcb-ewmh2 libxcb1-dev libxcb-keysyms1-dev libxcb-util0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcomposite-dev libxrandr-dev libxinerama-dev make cmake automake autoconf xdotool`
  * GitHub URL: git@github.com:tryone144/compton.git
  * Instructions: `make && make docs && sudo make install`

# Light
  * GitHub URL: git@github.com:haikarainen/light.git
  * Instructions:
  `cd /tmp && mkdir light && cd light && wget https://github.com/haikarainen/light/releases/download/v1.2/light-1.2.tar.gz && tar xf light-1.2.tar.gz && cd light-1.2 && ./configure && make && sudo make install`

# Network-Manager
  * Deps: `sudo apt install network-manager network-manager-config-connectivity-ubuntu network-manager-gnome`
  * Conf File Contents:
`
[keyfile]
managed-devices=*,except:type:loopbark,docker,except:type:wwan
`
  * Location: `/usr/lib/NetworkManager/conf.d/globally-managed-devices.conf`

# Fusuma
  * `sudo gpasswd -a $USER input && sudo apt-get install libinput-tools ruby && sudo gem install fusuma`