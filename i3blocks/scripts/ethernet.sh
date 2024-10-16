#!/bin/bash

state=$(cat /sys/class/net/enp4s0/operstate)
if [ "$state" = "up" ]; then
  ip=$(ip -4 addr show enp4s0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
  speed=$(cat /sys/class/net/enp4s0/speed 2>/dev/null || echo 'Unknown')
  echo "E: $ip - ($speed Mbps)"
  #echo "🌍 |"
else
  echo "E: down"
fi
