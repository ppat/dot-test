#!/bin/bash
set -eo pipefail

# Function to display the notification
notify () {
  echo $1
  osascript -e "display notification \"$1\" with title \"Battery Warning\" sound name \"Submarine\""
}

# Get the current battery percentage
battery_percent=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

# Notify when battery is at or below 5% and 2%
if [ $battery_percent -le 5 ] && [ $battery_percent -gt 2 ]; then
  notify "Your battery is at $battery_percent%. Please plug in your charger!"
fi

if [ $battery_percent -le 2 ]; then
  notify "Battery critically low! $battery_percent%. Plug in immediately!"
fi