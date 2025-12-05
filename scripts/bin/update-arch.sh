#!/usr/bin/env bash

sudo snapper -c root create --description "System update" &
wait

sudo pacman -Syu &
wait

paru -Syu &
wait

echo "System update is done"
