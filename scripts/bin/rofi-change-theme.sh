#!/usr/bin/bash

change () {
    ln -sf ~/.local/share/colors/$1/$1.css ~/.config/waybar/colors.css
    ln -sf ~/.local/share/colors/$1/$1.rasi ~/.config/rofi/colors.rasi
    # ln -sf ~/dotfiles/bemenu/.config/bemenu/bemenu-$1 ~/dotfiles/scripts/bin/bemenu-launch

    bash restart-waybar.sh
}

selected () {
    choice=$(echo -e "catppuccin-mocha\ngruvbox" | rofi -dmenu -p "Change theme: ")
    case $choice in
        "catppuccin-mocha") change "catppuccin-mocha" ;;
        "gruvbox") change "gruvbox" ;;
    esac
}

selected
