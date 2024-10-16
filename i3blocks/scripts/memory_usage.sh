#!/bin/bash
# Calculate memory usage
mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_free=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
mem_used=$(echo "$mem_total $mem_free" | awk '{print int(($1 - $2) / $1 * 100)}')

# Print memory usage
echo "RAM: $mem_used%"
