#!/bin/bash
{
  volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n1)
  mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes')

  if [ "$mute" != "yes" ]; then
    echo "  $volume |"
  else
    echo "  muted |"
  fi
}
