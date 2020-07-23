#!/bin/bash

WEBPAGE="https://apod.nasa.gov/apod"
WALLPAPER_DIR=~/.config/i3/wallpaper
mkdir -p "$WALLPAPER_DIR"

IMAGE=$(curl -s "$WEBPAGE/astropix.html" | perl -ne 'print $1 if m|<a href="(image/[^"]+)"|')

wget -q "$WEBPAGE/$IMAGE" -O "$WALLPAPER_DIR/wallpaper.jpg"

wal --vte -q -i "$WALLPAPER_DIR/wallpaper.jpg"
wal_steam -w

