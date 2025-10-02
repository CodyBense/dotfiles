#!/usr/bin/env bash
set -eu

DIR=$HOME/workspaces/github/CodyBense
other_projects="new\ndotfiles"
options=$(printf "${other_projects}\n$(ls $DIR)\n" | rofi -dmenu -p "Projects: ")

case "${options}" in
    "dotfiles")
        ghostty --class="com.project.ghostty" --title="$options" --working-directory=$HOME/dotfiles
        ;;
    "new")
        project_name="$(printf '' | rofi -dmenu -p 'Project Name: ')"
        [ -n "$project_name" ] || exit 0
        echo $DIR/$project_name
        mkdir -p $DIR/$project_name
        ghostty --class="com.project.ghostty" --title="$options" --working-directory=$DIR/$project_name
        ;;
    *)
        ghostty --class="com.project.ghostty" --title="$options" --working-directory=$DIR/$options
        ;;
esac
