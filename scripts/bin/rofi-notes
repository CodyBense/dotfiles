#!/usr/bin/env bash

choice="$(printf "pl\nph" | rofi -dmenu)" || exit 0

case $choice in
    pl) rsync -rtu cody@192.168.1.243:/data/Obsidian $HOME/Documents && notify-send "Pulling notes is done";;
    ph) rsync -rtu $HOME/Documents/Obsidian cody@192.168.1.243:/data && notify-send "Pushing notes is done";;
esac

