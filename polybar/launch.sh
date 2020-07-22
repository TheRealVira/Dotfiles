#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

polybar top
polybar bottom

echo "Bars launched..."
