#!/bin/bash

# Your OpenWeatherMap API key
API_KEY="6a3fe9ad9cae721016566b17c55f3ba7"

# Get dynamic location coordinates
location=$(~/.config/i3/scripts/get_location.sh)
LAT=$(echo $location | cut -d ',' -f 1)
LON=$(echo $location | cut -d ',' -f 2)

# Get weather data
weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=${LAT}&lon=${LON}&units=imperial&appid=${API_KEY}")

# Extract weather information
temperature=$(echo $weather | jq '.main.temp')
description=$(echo $weather | jq -r '.weather[0].description')

# Display weather information
echo " $temperature °F, $description |"
