#!/usr/bin/env bash

CONFIG="$HOME/.config/waypaper/config.ini"
WALLPAPER=$(grep "^wallpaper = " "$CONFIG" | cut -d'=' -f2 | xargs)
WALLPAPER="${WALLPAPER/#\~/$HOME}"

if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
    wal -i "$WALLPAPER" -n
    ln -sf ~/.cache/wal/colors-wofi.css ~/.config/wofi/style.css
    ln -sf ~/.cache/wal/colors-waybar.css ~/.config/waybar/style.css
    pkill -USR1 kitty
    pkill -SIGUSR2 waybar
fi
