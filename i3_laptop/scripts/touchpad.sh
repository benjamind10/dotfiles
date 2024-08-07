#!/bin/bash

# Get the device ID of the touchpad
DEVICE_NAME="ETPS/2 Elantech Touchpad"
DEVICE_ID=$(xinput list --id-only "$DEVICE_NAME")

if [ -n "$DEVICE_ID" ]; then
  # Enable tap-to-click
  xinput set-prop "$DEVICE_ID" "libinput Tapping Enabled" 1

  # Enable natural scrolling
  xinput set-prop "$DEVICE_ID" "libinput Natural Scrolling Enabled" 1

  # Additional settings (if needed)
  xinput set-prop "$DEVICE_ID" "libinput Tapping Drag Enabled" 1
  xinput set-prop "$DEVICE_ID" "libinput Tapping Drag Lock Enabled" 0
  xinput set-prop "$DEVICE_ID" "libinput Accel Speed" 0.000000
fi
