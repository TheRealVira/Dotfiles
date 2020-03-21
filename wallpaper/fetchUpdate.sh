#!/bin/bash

WEBPAGE="https://apod.nasa.gov"
WALLPAPER_DIR=~/.config/i3/wallpaper
mkdir -p "$WALLPAPER_DIR"

curl -s "$WEBPAGE/apod/" | \
	perl -ne 'print $1 if m|<a href="(image/[^"]+)"|' | \
	wget -B "$WEBPAGE" -q -i - -O "$WALLPAPER_DIR/wallpaper.jpg"
