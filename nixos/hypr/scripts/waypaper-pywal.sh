#!/usr/bin/env bash

waypaper

# Get the currently loaded wallpaper from hyprpaper
WALLPAPER=$(hyprctl hyprpaper listloaded 2>/dev/null | head -n1)

if [ -f "$WALLPAPER" ]; then
  wal -i "$WALLPAPER" -n
  killall -USR1 kitty
fi
