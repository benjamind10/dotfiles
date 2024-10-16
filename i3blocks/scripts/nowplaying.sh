#!/bin/bash

# Fetch the current playing track using playerctl
artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

# Check if either artist or title is empty, display "Nothing Playing"
if [[ -z "$artist" || -z "$title" ]]; then
  echo ""
else
  echo "🎵 $artist - $title"
fi
