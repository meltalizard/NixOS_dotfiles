#!/usr/bin/env bash

# Force battery to charge up to 90%
sudo tlp setcharge 0 90 BAT1

notify-send "Battery" "Charging forced to 90%"
