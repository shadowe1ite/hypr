#!/usr/bin/env bash
set -euo pipefail

# Icon blue + white time text (no bold), 12-hour with AM/PM
ICON_COLOR="blue"
TEXT_COLOR="#CEE9DC"

# Hour-based icon (Nerd Fonts)
hour_icons=(󱑖 󱑋 󱑌 󱑍 󱑎 󱑏 󱑐 󱑑 󱑒 󱑓 󱑔 󱑕)

hour="$(date +%-I)"   # 1..12
idx=$(( 10#$hour % 12 ))
icon="${hour_icons[$idx]}"

# No bold anywhere
printf ' #[fg=%s]%s #[fg=%s]%s' "$ICON_COLOR" "$icon" "$TEXT_COLOR" "$(date +%-I:%M\ %p)"
