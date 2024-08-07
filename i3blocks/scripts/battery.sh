#!/bin/bash

status=$(cat /sys/class/power_supply/BAT1/status)
capacity=$(cat /sys/class/power_supply/BAT1/capacity)

if [ "$status" = "Charging" ]; then
  echo "⚡ $capacity% |"
elif [ "$status" = "Discharging" ]; then
  echo "🔋 $capacity% |"
else
  echo "☻ $capacity% |"
fi
