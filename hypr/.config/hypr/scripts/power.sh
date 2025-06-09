#!/bin/bash

# Function to show a confirmation dialog
show_confirmation() {
    local action=$1
    zenity --question \
        --title="Confirmation" \
        --text="Are you sure you want to $action?" \
        --width=300 \
        --icon-name=system-$action
    return $?  # Return the exit code of zenity (0 for yes, 1 for no)
}

case $1 in
    --poweroff)
        if show_confirmation "power off"; then
            systemctl poweroff --now
        fi
        ;;
    --reboot)
        if show_confirmation "reboot"; then
            systemctl reboot --now
        fi
        ;;
    --logout)
        if show_confirmation "log out"; then
            hyprctl dispatch exit 1
        fi
        ;;
    --lock)
        # Execute lock immediately without confirmation
        hyprlock
        ;;
esac
