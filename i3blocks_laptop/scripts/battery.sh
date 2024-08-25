#!/bin/bash

# Get the charging status and battery capacity
status=$(cat /sys/class/power_supply/BAT1/status)
capacity=$(cat /sys/class/power_supply/BAT1/capacity)

# Display the battery status and capacity
echo "BAT: $capacity%"
