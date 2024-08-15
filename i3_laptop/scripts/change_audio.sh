#!/bin/bash

# Get the list of available sinks
SINKS=$(pactl list short sinks | awk '{print $1, $2}')

# Display the list of sinks and let the user choose one
SELECTED_SINK=$(echo "$SINKS" | rofi -dmenu -i -p "Select Audio Output:" | awk '{print $1}')

if [ -n "$SELECTED_SINK" ]; then
  # Set the selected sink as the default sink
  pactl set-default-sink "$SELECTED_SINK"

  # Move all current playback streams to the new sink
  pacmd list-sink-inputs | grep index | while read line; do
    INPUT_INDEX=$(echo $line | cut -f2 -d' ')
    pactl move-sink-input "$INPUT_INDEX" "$SELECTED_SINK"
  done
fi
