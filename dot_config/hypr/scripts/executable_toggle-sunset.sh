#!/usr/bin/env bash

# Toggle script to turn on or off hyprsunset depending on if it's already turned on or not

STATE_FILE="/tmp/hyprsunset_state"

if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "on" ]; then
    # Disable filter (return to normal color)
    hyprctl hyprsunset identity
    echo "off" > "$STATE_FILE"
else
    # Enable filter (3000K warm color)
    hyprctl hyprsunset temperature 3000
    echo "on" > "$STATE_FILE"
fi