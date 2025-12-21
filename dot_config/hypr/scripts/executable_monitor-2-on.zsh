#!/usr/bin/env zsh

hyprctl keyword monitor DP-3,enable
hyprctl keyword monitor DP-3,2560x1440@59.999,3840x0,1,bitdepth,10,transform,1
hyprctl hyprpaper wallpaper "DP-3,~/Pictures/wallpaper/bc.jpg"
$HOME/.config/hypr/scripts/speakers-tv.zsh
