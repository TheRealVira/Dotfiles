#!/bin/bash

WEBPAGE="https://apod.nasa.gov/apod/"

wget "${WEBPAGE}" --quiet -O temp.html

grep -m 1 jpg "temp.html" | grep -o '".*"' | sed 's/"//g' | awk -v var="${WEBPAGE}" '{print var$1}' | xargs wget --quiet -O wallpaper.jpg

rm ~/.config/i3/wallpaper/*
cp wallpaper.jpg ~/.config/i3/wallpaper/
