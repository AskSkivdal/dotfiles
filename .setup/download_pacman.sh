#!/bin/bash

echo "Basic packages"
pacman -Sy kitty thunar nm-applet dunst kanshi playerctl waybar swaylock pavucontrol jq

echo "Stuff for grimshot"
pacman -Sy grim slurp hyprpicker wl-clipboard