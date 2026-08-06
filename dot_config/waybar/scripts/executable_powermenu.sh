#!/usr/bin/env bash
options="⏻ Shutdown\n⏾ Suspend\n Reboot\n Lock\n󰈆 Logout"
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power")

case "$chosen" in
    *Shutdown*) systemctl poweroff ;;
    *Suspend*) systemctl suspend ;;
    *Reboot*) systemctl reboot ;;
    *Lock*) hyprlock ;;
    *Logout*) hyprctl dispatch exit ;;
esac
