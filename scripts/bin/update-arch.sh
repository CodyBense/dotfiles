#!/usr/bin/env bash

sudo snapper -c root create --description "System update"

sudo snapper list

sudo pacman -Syu

paru -Syu

printf "\nSystem update is done"
