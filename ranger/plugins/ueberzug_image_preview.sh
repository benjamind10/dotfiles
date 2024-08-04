#!/bin/bash

set -euo pipefail

FIFO_UEBERZUG="/tmp/ueberzug-$$"

# Clean up
cleanup() {
  rm -f "$FIFO_UEBERZUG"
  pkill -P $$
}
trap cleanup EXIT

# Create FIFO file
mkfifo "$FIFO_UEBERZUG"
ueberzug layer --parser bash <"$FIFO_UEBERZUG" &

while IFS= read -r line; do
  path=$(echo "$line" | cut -d' ' -f1)
  case "$path" in
  *.jpg | *.jpeg | *.png | *.gif | *.bmp | *.svg | *.xpm)
    echo '{"action": "add", "identifier": "preview", "x": 1, "y": 1, "path": "'"$path"'", "scaler": "fit_contain", "width": '$3', "height": '$4'}' >"$FIFO_UEBERZUG"
    ;;
  *)
    continue
    ;;
  esac
done
