#!/bin/zsh
if pgrep -x "rofi" > /dev/null; then
    # Rofi is running, kill it
    pkill -x rofi
    exit 0
fi
DIR=/home/codybense/Pictures/wallpapers
arr=($DIR/*)
filenames=()
for e in ''${arr[@]}; do
    filenames=("''${filenames[@]}" ''${e##*/}) 
done
choice=$(printf "%s\n" "''${filenames[@]}" | rofi -dmenu) 
swww img ''${DIR}/''${choice} --transition-fps 30 --transition-type any --transition-duration 3 --resize crop
