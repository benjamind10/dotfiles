#!/bin/bash

# Volume retrieval
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes')

# Bluetooth battery retrieval
device_info=$(upower -i $(upower -e | grep headset))
battery_level=$(echo "$device_info" | grep "percentage:" | awk '{print $2}')

# Determine what to display based on the mute status and Bluetooth connection
if [ "$mute" = "yes" ]; then
  volume_display="VOL:  muted"
else
  volume_display="VOL:  $volume"
fi

# Append Bluetooth battery level if available
if [ ! -z "$battery_level" ]; then
  echo "$volume_display - 🎧 $battery_level"
else
  echo "$volume_display"
fi
