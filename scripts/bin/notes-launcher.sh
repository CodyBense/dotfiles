#!/usr/bin/env bash

folder=/home/codybense/Documents/Obsidian/

sync () { \
    rsync -rtu $HOME/Documents/Obsidian cody@vault:/data && rsync -rtu cody@vault:/data/Obsidian $HOME/Documents && notify-send "Syncing notes is complete"
}

selected () { \
    choice=$(echo "Sync\n$(command ls -t1 $folder)" | bemenu-launch -c -l 5 -i -p "Notes menu: ")
    case $choice in 
        "Sync") sync ;;
    esac
}

selected
