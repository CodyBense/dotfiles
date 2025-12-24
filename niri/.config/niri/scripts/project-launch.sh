#!/usr/bin/env bash
set -eu

DIR=$HOME/workspaces/github/CodyBense
other_projects="new\ndotfiles"
options=$(printf "${other_projects}\n$(ls $DIR)\n" | rofi -dmenu -p "Projects: ")

case "${options}" in
    "dotfiles")
        kitty --title "$options" --app-id project --directory $HOME/dotfiles zellij a -c dotfiles &
        emacsclient -c $HOME/dotfiles/
        ;;
    "new")
        project_name="$(printf '' | rofi -dmenu -p 'Project Name: ')"
        [ -n "$project_name" ] || exit 0
        echo $DIR/$project_name
        mkdir -p $DIR/$project_name
        kitty --title "$options" --app-id project --directory $DIR/$project_name zellij a -c $project_name &
        emacsclient -c $DIR/$project_name
        ;;
    *)
        kitty --title "$options" --app-id project --directory $DIR/$options zellij a -c $options &
        emacsclient -c $DIR/$options
        ;;
esac
