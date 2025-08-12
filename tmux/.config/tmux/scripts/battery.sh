#!/usr/bin/env bash
set -euo pipefail

# Icon color only
ICON_COLOR="#00D98D"   # green (hex)
TEXT_COLOR="#CEE9DC"     # percentage text

# Read capacity
cap=""
for p in /sys/class/power_supply/BAT*/capacity /sys/class/power_supply/*/capacity; do
  if [[ -r "$p" ]]; then
    v="$(tr -cd '0-9' < "$p" 2>/dev/null || true)"
    if [[ -n "$v" ]]; then cap="$v"; break; fi
  fi
done
cap="${cap:-0}"

# Read status
status="Unknown"
for s in /sys/class/power_supply/BAT*/status /sys/class/power_supply/*/status; do
  if [[ -r "$s" ]]; then
    status="$(tr -d '\n\r' < "$s" 2>/dev/null || true)"
    [[ -n "$status" ]] && break
  fi
done

# Icons (Nerd Fonts)
charging_icons=(󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅)
discharging_icons=(󱃍 󰁺 󰁻 󰁼 󰁽 󰁿 󰁾 󰂀 󰂁 󰂂 󰁹)

if [[ "$status" == "Charging" || ( "$status" == "Full" && "$cap" -ge 100 ) ]]; then
  icons=("${charging_icons[@]}")
else
  icons=("${discharging_icons[@]}")
fi

n="${#icons[@]}"
idx=$(( cap * (n - 1) / 100 ))
(( idx < 0 )) && idx=0
(( idx >= n )) && idx=$((n - 1))
icon="${icons[$idx]}"

# Icon colored, text white. No bold.
printf '#[fg=%s]%s#[fg=%s] %d%%' "$ICON_COLOR" "$icon" "$TEXT_COLOR" "$cap"
