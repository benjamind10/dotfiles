#!/bin/bash

get_cpu_usage() {
  cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  echo -e "CPU: $cpu%"
  progress_bar ${cpu%.*} 100 50
  echo " ($cpu%)"
}

get_cpu_usage

