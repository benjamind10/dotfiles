#!/bin/bash
# check_microphone_usage.sh

# Check if microphone is in use
if pactl list sources | grep -q 'State: RUNNING'; then
  echo "🎙️"
else
  echo ""
fi
