#!/bin/sh

case "$1" in
lock)
  i3lock -i /home/bduran/Pictures/5-galaxy-cool-wallpapers-1024x640.webp
  ;;
logout)
  i3-msg exit
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
