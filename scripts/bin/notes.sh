#!/usr/bin/env bash

choice="$(printf "pl\nph" | rofi -dmenu -p "Notes: ")" || exit 0

case $choice in
    pl) rsync -rtu cody@vault:/data/Obsidian $HOME/Documents && notify-send "Pulling notes is done";;
    ph) rsync -rtu $HOME/Documents/Obsidian/* cody@vault:/data/Obsidian && notify-send "Pushing notes is done";;
esac

