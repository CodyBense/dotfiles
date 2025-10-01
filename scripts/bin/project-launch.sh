#!/usr/bin/env bash
set -eu

DIR=$HOME/workspaces/github/CodyBense
other_projects="new\ndotfiles"
options=$(printf "${other_projects}\n$(ls $DIR)\n" | rofi -dmenu -p "Projects: ")

case "${options}" in
    "dotfiles")
        ghostty --title="project" --working-directory=$HOME/dotfiles
        ;;
    "new")
        project_name="$(printf '' | rofi -dmenu -p 'Project Name: ')"
        [ -n "$project_name" ] || exit 0
        echo $DIR/$project_name
        mkdir -p $DIR/$project_name
        ghostty --title="project" --working-directory=$DIR/$project_name
        ;;
    *)
        ghostty --title="project" --working-directory=$DIR/$options
        ;;
esac
