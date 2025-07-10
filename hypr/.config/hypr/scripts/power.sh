#!/bin/bash

# Function to show a confirmation dialog using yad
show_confirmation() {
    local action=$1
    yad --question \
        --title="Confirmation" \
        --text="  Are you sure you want to $action?  " \
        --text-align=center \
        --image="system-$action" \
        --image-dialog \
        --window-icon="system-$action" \
        --button="Yes!gtk-yes:0" --button="No!gtk-no:1" \
        --width=350 \
        --height=150 \
        --center
    return $?  # 0 = Yes, 1 = No
}

case $1 in
    --poweroff)
        if show_confirmation "poweroff"; then
            systemctl poweroff --now
        fi
        ;;
    --reboot)
        if show_confirmation "reboot"; then
            systemctl reboot --now
        fi
        ;;
    --logout)
        if show_confirmation "logout"; then
            hyprctl dispatch exit 1
        fi
        ;;
    --lock)
        sleep 0.3  # slight delay for smoother transition
        hyprlock
        ;;
esac
