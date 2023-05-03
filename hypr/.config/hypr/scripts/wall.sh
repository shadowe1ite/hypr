#!/bin/bash
sleep 0.5
echo "$(find ~/wall -type f | shuf -n 1)" > /tmp/walnow

sleep 2
wal -i $(cat /tmp/walnow)
swww img $(cat /tmp/walnow)
pkill -9 wal
