#!/usr/bin/env bash

CONFIG="$HOME/.config/waypaper/config.ini"
WALLPAPER=$(grep "^wallpaper = " "$CONFIG" | cut -d'=' -f2 | xargs)
WALLPAPER="${WALLPAPER/#\~/$HOME}"

if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
    wal -i "$WALLPAPER" -n
    pkill -USR1 kitty
fi
