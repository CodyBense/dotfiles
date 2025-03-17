#! /usr/bin/env bash

echo "Input the month of finances you want to track: "

read month

python3 ~/workspaces/Projects/spending_tracker/main.py $month
