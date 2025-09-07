#!/usr/bin/env bash

IFS=" "

monitors=$(niri msg --json outputs | jq '[.[].name] | join(" ")' -r)
read -ra monitor_arr <<< "${monitors}"
monitor_1="eDP-1"
monitor_2="DP-3"

workspaces_internal=$(niri msg --json workspaces | jq '[.[] | select (.active_window_id != null and .output == "eDP-1")]' | jq '[.[].idx] | join(" ")' -r)
read -ra workspace_internal_arr <<< "${workspaces_internal}"

workspaces_external=$(niri msg --json workspaces | jq '[.[] | select (.active_window_id != null and .output == "DP-3")]' | jq '[.[].idx] | join(" ")' -r)
read -ra workspace_external_arr <<< "${workspaces_external}"

if (( ${#monitor_arr[@]} == 1 )); then
    if (( ${monitor_arr[0]} == ${monitor_1} )); then
        echo "only internal monitor"
    else
        # turn on eDP-1 monitor and move all workspaces to it
        echo "only external monitor"
        niri msg output ${monitor_1} on
        niri msg action focus-monitor ${monitor_2}
        for workspace in ${workspace_external_arr[@]}; do
            niri msg action focus-workspace ${workspace}
            niri msg action move-workspace-to-monitor ${monitor_1}
        done
    fi
else
    # move all workspaces on eDP-1 to DP-3 then turn off eDP-1
    echo "both internal and external monitors are on"
    for workspace in ${workspaces_internal_arr[@]}; do
        niri msg action focus-workspace ${workspace}
        niri msg action move-workspace-to-monitor ${monitor_2} 
    done
    niri msg output ${monitor_1} off
fi
