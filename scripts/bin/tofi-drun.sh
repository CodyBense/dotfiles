#!/usr/bin/env bash

THEME=$(cat $HOME/.local/share/THEME)

case "${THEME}" in
    "catppuccin-mocha")
        tofi-drun --drun-launch=true --config=$HOME/.config/tofi/config-catppuccin-mocha
        ;;
    "gruvbox")
        tofi-drun --drun-launch=true --config=$HOME/.config/tofi/config-gruvbox
        ;;
esac
