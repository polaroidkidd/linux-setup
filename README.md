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

## i3 HotKeys

modkey                  => left windows
terminator              => mod+y
brave-browser           => mod+g
firefox                 => mod+c
rofi                    => mod+tab
bluetooth               => mod+b
copyq                   => left_alt + q
switch workspace left   => mod+left_ctrl+a
switch workspace right  => mod+left_ctrl+s

## Touchpad Gestures

Touchpad Gestures are handled with fusuma and xdotool. The following configs have been applied. You can change these in the `~/.config/fusuma/config.yml` file. **Note: The pinch does not always work as expected when trying to zoom in and out on websites. I've been using `ctrl+dash` and `ctrl+left_shift+^` to zoom in and out.

```
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