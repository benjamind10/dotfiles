#!/bin/bash

status=$(playerctl --player=spotify status)

if [[ $status == "Playing" ]]; then
  artist=$(playerctl --player=spotify metadata artist)
  title=$(playerctl --player=spotify metadata title)
  echo "♫ $artist - $title"
elif [[ $status == "Paused" ]]; then
  echo "♫ Paused"
else
  echo "♫ Stopped"
fi
