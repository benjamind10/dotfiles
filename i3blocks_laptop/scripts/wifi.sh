#!/bin/bash

# Set the wireless interface explicitly
INTERFACE="wlo1" # Replace wlo1 with your wireless interface name

# Function to fetch data
fetch_wireless_data() {
  local interface=$1
  local state=$(cat /sys/class/net/$interface/operstate)
  if [[ $state == "up" ]]; then
    local essid=$(iwgetid -r)
    local ip=$(ip -4 addr show $interface | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    local strength=$(grep $interface /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

    # Properly fetch and format the bitrate information
    local bitrate=$(iw dev $interface link | grep -oP 'tx bitrate: \K\d+.\d+ \w+') # Parse tx bitrate correctly
    bitrate=${bitrate:-N/A}                                                        # Use 'N/A' if bitrate is empty

    # Determine the icon based on signal strength
    local icon="🔇" # default for very low/undetectable strength
    if [[ "$strength" -ge 75 ]]; then
      icon="🛜" # strong signal
    elif [[ "$strength" -ge 50 ]]; then
      icon="🔉" # medium signal
    elif [[ "$strength" -ge 25 ]]; then
      icon="🔈" # weak signal
    fi

    #echo "$icon $essid - $ip - ($strength%, $bitrate)"
    echo "$icon $essid - ($strength%)"

  else
    echo "W: down"
  fi
}

# Execute the function with the specified interface
fetch_wireless_data "$INTERFACE"
