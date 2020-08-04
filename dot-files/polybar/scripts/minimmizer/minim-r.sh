#!/usr/bin/env bash

# uses dmenu to select a minimised window, and restore it
declare -A names
options=""
touch ~/.minim

while read window_id; do
  window_name=$(xdotool getwindowname $window_id)
  if [ -n "$window_name" ]; then
    if [ -z "${names[ $window_name ]}" ]; then
      displayed_name=" $window_name "
    else
      i=1
      while [ -n "${names[ $window_name ($i) ]}" ]; do
        i=$(( $i+1 ))
      done
      displayed_name=" $window_name ($i) "
    fi
    names[$displayed_name]=$window_id
    options=$options$displayed_name'\n'
  fi
done < ~/.minim

if [ -n "$options" ]; then
  choice=$(echo -e "$options Cancel " | $HOME/.config/dmenu/dmenu.sh -i -p "Restore window: ")

  if [ "$choice" == ' Cancel ' ]; then
    echo "Cancelled"
  else
    echo "Restoring '$choice'"
    xdotool windowmap "${names[$choice]}"
    names[$choice]=
    rm ~/.minim
    for window_id in "${names[@]}"; do
      if [ -n "$window_id" ]; then
        echo $window_id >> ~/.minim
      fi
    done
  fi
fi
