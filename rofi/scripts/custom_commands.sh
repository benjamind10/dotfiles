#!/bin/bash

# Define the path to the commands file
COMMANDS_FILE="$HOME/.config/rofi/rofi-commands.txt"

# Check if the commands file exists
if [ ! -f "$COMMANDS_FILE" ]; then
  echo "Commands file not found!" >"$HOME/.config/rofi/rofi-commands.txt"
fi

# Launch Rofi to execute a command
chosen_command=$(rofi -dmenu -i -p "Commands:" <"$COMMANDS_FILE")

# Execute the chosen command in zsh, if not empty
if [ -n "$chosen_command" ]; then
  zsh -ic "$chosen_command"
else
  echo "No command selected."
fi
