#!/bin/bash

case "$1" in
lock)
  swaylock
  ;;
logout)
  swaymsg exit
  ;;
suspend)
  systemctl suspend
  ;;
hibernate)
  systemctl hibernate
  ;;
reboot)
  systemctl reboot
  ;;
shutdown)
  systemctl poweroff
  ;;
*)
  echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
  exit 2
  ;;
esac

exit 0
