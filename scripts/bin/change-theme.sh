#!/usr/bin/env bash

change () { 
    ln -sf ~/.local/share/colors/$1/$1.css ~/.config/waybar/colors.css
    ln -sf ~/.local/share/colors/$1/$1.rasi ~/.config/rofi/colors.rasi
    ln -sf ~/.config/tofi/config-$1 ~/.config/tofi/config

    bash restart-waybar.sh
}

selected () { 
    choice=$(echo -e "catppuccin-mocha\ngruvbox" | rofi -dmenu -p "Theme: ")
    case $choice in 
        "catppuccin-mocha")
            change "catppuccin-mocha"
            swww img $HOME/Pictures/wallpapers/catppuccin-mocha/cm-minimalist-black-hole.png
            ;;
        "gruvbox")
            change "gruvbox"
            swww img $HOME/Pictures/wallpapers/gruvbox/gb-solarsys.png
            ;;
    esac
}

selected
