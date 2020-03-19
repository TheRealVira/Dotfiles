#!/bin/bash

WEBPAGE="https://apod.nasa.gov/apod/"
WALLPAPER_DIR=~/.config/i3/wallpaper

wget "${WEBPAGE}" --quiet -O temp.html

grep -m 1 jpg "temp.html" | grep -o '".*"' | sed 's/"//g' | awk -v var="${WEBPAGE}" '{print var$1}' | xargs wget --quiet -O wallpaper.jpg

rm -rf "${WALLPAPER_DIR}"
mkdir "${WALLPAPER_DIR}"
cp wallpaper.jpg "${WALLPAPER_DIR}"
