#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

. "~/.cache/wal/colors.sh"

polybar top &
polybar bottom &

echo "Bars launched..."
