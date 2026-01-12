#!/usr/bin/env bash
waypaper

# Get the currently loaded wallpaper from hyprpaper
WALLPAPER=$(hyprctl hyprpaper listloaded 2>/dev/null | head -n1)

if [ -f "$WALLPAPER" ]; then
  # Update hyprpaper config in home directory (writable location)
  mkdir -p ~/.local/state/hypr
  cat > ~/.local/state/hypr/hyprpaper.conf <<EOF
preload = $WALLPAPER
wallpaper = ,$WALLPAPER
splash = false
EOF

  wal -i "$WALLPAPER" -n
  pkill -USR1 kitty
fi
