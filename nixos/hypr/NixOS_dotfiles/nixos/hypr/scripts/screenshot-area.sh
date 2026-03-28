#!/usr/bin/env bash

FILENAME=~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png

# Screenshot selected area, save and copy to clipboard
grim -g "$(slurp)" "$FILENAME" && wl-copy < "$FILENAME"
