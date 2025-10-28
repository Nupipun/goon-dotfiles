#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

# Check if any monitor is currently active (DPMS on)
MONITOR_STATUS=$(/usr/bin/hyprctl monitors | grep "dpmsStatus")

if [[ "$MONITOR_STATUS" == *"dpmsStatus: 1"* ]]; then
    # Monitors are on, so turn them off and set RGB to black
    /usr/bin/hyprctl dispatch dpms off
    /usr/bin/openrgb --device 0 --color 000000 --device 1 --color 000000 &
else
    # Monitors are off, so turn them on and set RGB to the custom color
    /usr/bin/hyprctl dispatch dpms on
    /usr/bin/openrgb --device 0 --color 0F2024 --device 1 --color 0F2024 &
fi
