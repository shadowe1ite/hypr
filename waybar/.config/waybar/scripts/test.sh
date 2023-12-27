#!/usr/bin/env bash

typefx() {
    delay=$1
    string=$2

    for ((char = 0; char < ${#string}; char++)); do
        echo -n "${string:$char:1}"
        sleep $delay
    done

    # Erase the text with backspaces
    for ((char = 0; char < ${#string}; char++)); do
        echo -n -e "\b \b"
        sleep $delay
    done
}

while true;do typefx 0.09 "Hack The Planet ";done
