#!/usr/bin/env bash

THEME=$(cat $HOME/.local/share/THEME)
DIR=$HOME/Pictures/wallpapers

change_wallpaper () {
    swww img $DIR/$1
}

case "${THEME}" in
    "catppuccin-mocha")
        choice=$(printf "$(ls $HOME/Pictures/wallpapers/$THEME)" | rofi -dmenu -p "Wallpaper: ") || exit 0
        change_wallpaper $choice
        ;;
    "gruvbox")
        choice=$(printf "$(ls $HOME/Pictures/wallpapers/$THEME)" | rofi -dmenu -p "Wallpaper: ") || exit 0
        change_wallpaper $choice
        ;;
    *)
        echo "wrong theme"
        ;;
esac
