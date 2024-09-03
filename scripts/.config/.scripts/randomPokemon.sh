#!/bin/zsh
pokemon=("gengar" "latios" "charizard" "typhlosion" "emboar" "hydreigon" "garchomp" "infernape" "salamence" "flygon" "mudkip" "scizor" "dragonite" "snorlax")

size=${#pokemon[@]}
index=$(($RANDOM % $size))

if [ $index -eq 0 ]
then
    index=1
fi

shiny=$(($RANDOM%2))

if [ $shiny -eq 0 ]
then
    rustmon print --hide-name -n ${pokemon[$index]}
else
    rustmon print --hide-name -n ${pokemon[$index]} -s 1
fi
