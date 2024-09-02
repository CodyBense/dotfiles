#!/bin/zsh

# Get user selection via wofi from emoji file.
chosen=$(cat $HOME/.config/.emoji | rofi -i -dmenu -config ~/.config/rofi/config-emoji.rasi | awk '{print $1}')

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
  ydotool type "$chosen"
else
  printf "$chosen" | wl-copy
  notify-send "'$chosen' copied to clipboard." &
fi
