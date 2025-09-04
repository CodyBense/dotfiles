#!/usr/bin/env bash

hyprctl dispatch exit

if [ $? == 1 ]; then
    niri msg action quit -s
fi

