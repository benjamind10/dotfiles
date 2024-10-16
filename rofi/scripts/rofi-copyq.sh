#!/bin/bash

# Path to the CopyQ executable
COPYQ="/usr/bin/copyq"

# Check if CopyQ is running
if ! pgrep -x "copyq" >/dev/null; then
  echo "Starting CopyQ..."
  $COPYQ &
  sleep 1 # Give CopyQ time to start
fi

# Generate a list of clipboard items
# The command 'copyq rows' doesn't exist; you need to use 'copyq read' or similar
CLIPBOARD_ITEMS=$($COPYQ read 0-9) # This reads the first 10 items from the clipboard

# If you want to show items with indices:
CLIPBOARD_MENU=""
for i in $(seq 0 9); do
  ITEM=$($COPYQ read text/plain $i 2>/dev/null)
  if [[ -n "$ITEM" ]]; then
    # Append index and item content to the menu string
    CLIPBOARD_MENU+="[$i] $ITEM\n"
  fi
done

# Use Rofi to display clipboard items
# Check if there are items to display
if [ -z "$CLIPBOARD_MENU" ]; then
  echo "Clipboard is empty."
else
  echo -e "$CLIPBOARD_MENU" | rofi -dmenu -i -p "Clipboard History:" -width 50 -lines 10
fi
