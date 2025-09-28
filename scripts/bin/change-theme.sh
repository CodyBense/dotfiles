#!/usr/bin/env bash

change () { 
    ln -sf ~/.local/share/colors/$1/$1.css ~/.config/waybar/colors.css
    ln -sf ~/.local/share/colors/$1/$1.rasi ~/.config/rofi/colors.rasi
    # ln -sf ~/dotfiles/bemenu/.config/bemenu/bemenu-$1 ~/dotfiles/scripts/bin/bemenu-launch

    bash restart-waybar.sh
}

selected () { 
    choice=$(echo -e "catppuccin-mocha\ngruvbox" | tofi.sh)
    case $choice in 
        "catppuccin-mocha")
            change "catppuccin-mocha"
            echo "${choice}" > $HOME/.local/share/THEME
            swww img $HOME/Pictures/wallpapers/catppuccin-mocha/cm-minimalist-black-hole.png
            ;;
        "gruvbox")
            change "gruvbox"
            echo "${choice}" > $HOME/.local/share/THEME
            swww img $HOME/Pictures/wallpapers/gruvbox/gb-solarsys.png
            ;;
    esac
}

selected
