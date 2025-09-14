#!/usr/bin/env bash


monitors=
monitors_arr=()
monitor_1="eDP-1"
monitor_2="DP-3"
focused_window=$(niri msg --json workspaces | jq '.[] | select (.is_focused == true)' | jq '.active_window_id' -r)

get_monitors () {
    monitors=$(niri msg --json outputs | jq '[.[] | select( .current_mode == 0)]' | jq '[.[].name] | join(" ")' -r)
    read -ra monitors_arr <<< "${monitors}"
}

get_monitors

if [ -z ${monitors_arr[1]} ]; then
    if [ ${monitors_arr[0]} == ${monitor_2} ]; then
        # external on and internal off
        niri msg output ${monitor_1} on
        sleep 0.5
        niri msg output ${monitor_2} off
        niri msg action focus-window --id ${focused_window}
        notify-send "Sending workspaces to internal monitor"
    elif [ ${monitors_arr[0]} == ${monitor_1} ]; then
        niri msg output ${monitor_2} on
        sleep 0.5
        niri msg output ${monitor_1} off
        niri msg action focus-window --id ${focused_window}
        notify-send "Sending workspaces to external monitor"
        # get_monitors
        # if [ ${monitors_arr[0]} != ${monitor_1} ]; then
        #     sleep 0.5
        #     niri msg output ${monitor_1} off
        #     niri msg action focus-window --id ${focused_window}
        #     notify-send "Sending workspaces to external monitor"
        # fi

    fi
else
    sleep 1
    niri msg output ${monitor_1} off
    niri msg action focus-window --id ${focused_window}
    notify-send "Sending workspaces to external monitor"
fi
