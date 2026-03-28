#!/usr/bin/env bash

FILENAME=~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png

# Screenshot entire screen, save and copy to clipboard
grim "$FILENAME" && wl-copy < "$FILENAME"
