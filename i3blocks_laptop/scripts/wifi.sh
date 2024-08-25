#!/bin/bash

# Set the wireless interface explicitly
INTERFACE="wlo1" # Replace wlo1 with your wireless interface name

# Function to fetch data
fetch_wireless_data() {
  local interface=$1
  local state=$(cat /sys/class/net/$interface/operstate)
  if [[ $state == "up" ]]; then
    # Fetch the signal strength as RSSI percentage
    local rssi=$(grep $interface /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')
    # Get the IP address
    local ip=$(ip addr show $interface | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)

    # Display IP and RSSI
    echo "IP: $ip, RSSI: $rssi%"
  else
    echo "IF down" # Interface down
  fi
}

# Execute the function with the specified interface
fetch_wireless_data "$INTERFACE"
