#!/bin/bash

# Fetch location data based on IP address
location=$(curl -s ipinfo.io)

# Extract latitude and longitude
latitude=$(echo $location | jq -r '.loc' | cut -d ',' -f 1)
longitude=$(echo $location | jq -r '.loc' | cut -d ',' -f 2)

echo "$latitude,$longitude"
