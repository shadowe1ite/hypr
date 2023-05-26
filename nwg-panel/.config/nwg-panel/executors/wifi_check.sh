#!/usr/bin/env bash
if iwgetid | grep -q "ESSID"; then echo "󰤪 "; else echo "󰤩 "; fi
