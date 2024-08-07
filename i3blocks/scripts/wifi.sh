#!/bin/bash

# Set the wireless interface explicitly
INTERFACE="wlo1" # Replace wlo1 with your wireless interface name

# Check if the interface is up
if [[ -n "$INTERFACE" && $(cat /sys/class/net/$INTERFACE/operstate) == "up" ]]; then
  ESSID=$(iwgetid -r)
  IP=$(ip -4 addr show $INTERFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
  QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')
  BITRATE=$(iw dev $INTERFACE link | grep bitrate | awk '{print $3 $4}')

  echo "📶 $ESSID - $IP - ($QUALITY%, $BITRATE) |"
else
  echo "W: down"
fi
