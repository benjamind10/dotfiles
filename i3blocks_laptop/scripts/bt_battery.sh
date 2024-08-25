#!/bin/bash

# Getting the Bluetooth device's battery status
device_info=$(upower -i $(upower -e | grep headset))

# Extract the percentage of battery remaining
battery_level=$(echo "$device_info" | grep "percentage:" | awk '{print $2}')

# Check if the device is connected and display the battery status
if [[ $battery_level != "" ]]; then
  echo "🎧 $battery_level"
else
  echo ""
fi
