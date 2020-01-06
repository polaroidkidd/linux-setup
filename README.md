# Linux-Setup for dell xps 9370

This setup script will install and configure i3-gaps with TryOne's Compton implementation for a frosted-glass terminal and rofi. This script has been tested on a clean (completly empty) Ubuntu Server 18.04 installation.

## Tools

* vs code
* hub cli
* miniconda
* intellij idea ultimate (no licence included)
* miniconda
* terminator
* firefox
* google-chrome
* brave browser
* keepassX
* copyQ
* polybar (with included Roboto Mono font)
* docker
* docker-compose

## PPAs

These PPA's are required for the script to work. I've tried adding them all in the setup script but either Speed-Ricer or Nextcloud fails randomly when attempting to retrieve the GPG-Key.
I've added scripts to add these PPAs since typing all this out can be a pain. They've been copy & pasted directly from the spotify/brave/microsoft website.

### VS Code

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
```

### Spotify

```bash
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```

### Brave Browser

```bash
sudo apt install -y apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
```

### Polybar (Speed Ricer)

```bash
sudo add-apt-repository -y ppa:kgilmer/speed-ricer
```

### NextCloud

```bash
sudo add-apt-repository -y ppa:nextcloud-devs/client
```

## i3 HotKeys

|exec|shortcut|
|-|-|
|modkey|`left windows`|
|terminator|`mod+y`|
|change wallpaper|`mod+left_shift+w`|
|reload polybar|`mod+left_shift+p`|
|brave-browser|`mod+g`|
|firefox|`mod+c`|
|rofi|`mod+tab`|
|bluetooth|`mod+b`|
|copyq|`left_alt + q`|
|switch workspace left|`mod+left_ctrl+a`|
|switch workspace right|`mod+left_ctrl+s`|

**Note:** I've added shortcuts to reload the polybar separately from everything. Polybar does not reload the frosted glass formatting when the background is changed. Therefore, if you previous wallpaper was white and the current one is black, Polybar will retain the white frosted glass. With the added shortcuts you can cycle through wallpapers using `mod+left_shift+w` until you find one and then reload the polybar uisng `mod+left_shift+p` to update the forsted glass colour.

## Touchpad Gestures

Touchpad Gestures are handled with fusuma and xdotool. The following configs have been applied. You can change these in the `~/.config/fusuma/config.yml` file. **Note: The pinch does not always work as expected when trying to zoom in and out on websites. I've been using `ctrl+dash` and `ctrl+left_shift+^` to zoom in and out.

```yml
swipe:
  3:
    left:
      command: 'xdotool key ctrl+Prior'
      threshold: 0.5
    right:
      command: 'xdotool key ctrl+Next'
      threshold: 0.5
    up:
      command: 'xdotool key ctrl+t'
      threshold: 0.5
    down:
      command: 'xdotool key ctrl+w'
      threshold: 0.5
  4:
    left:
      command: 'xdotool key Super_L+ctrl+a'
      threshold: 0.5
    right:
      command: 'xdotool key Super_L+ctrl+s'
      threshold: 0.5
    up:
      command: 'xdotool key Super_L+Tab'
      threshold: 0.5
    down:
      command: 'xdotool key Super_L+shift+q'
      threshold: 0.8
pinch:
  2:
    in:
      command: 'xdotool key ctrl+plus'
      threshold: 0.1
    out:
      command: 'xdotool key ctrl+minus'
      threshold: 0.1

threshold:
  swipe: 1
  pinch: 0.1

interval:
  swipe: 1
  pinch: 0.1
```
