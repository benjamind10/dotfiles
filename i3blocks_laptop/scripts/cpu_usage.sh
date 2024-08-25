#!/bin/bash
# Get CPU usage
cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=int(($2+$4)*100/($2+$4+$5))} END {print usage "%"}')

# Print CPU usage
echo "CPU: $cpu_usage"
