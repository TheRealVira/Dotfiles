#!/bin/bash

WEBPAGE="https://apod.nasa.gov/apod"
WALLPAPER_DIR=~/.config/i3/wallpaper
mkdir -p "$WALLPAPER_DIR"

IMAGE=$(curl -s "$WEBPAGE/astropix.html" | perl -ne 'print $1 if m|<a href="(image/[^"]+)"|')

# Only replace file, if newer and wget succeeded. (if original file does not exist or the checksum does not match)
if wget -b "$WEBPAGE/$IMAGE" -O "$WALLPAPER_DIR/wallpaper-new.jpg" || ! -f "$WALLPAPER_DIR/wallpaper.jpg" || md5sum "$WALLPAPER_DIR/wallpaper.jpg" -eq md5sum "$WALLPAPER_DIR/wallpaper-new.jpg"
then
	mv -f "$WALLPAPER_DIR/wallpaper-new.jpg" "$WALLPAPER_DIR/wallpaper.jpg"
       	wal -q 90 -i ~/.config/i3/wallpaper/wallpaper.jpg
	exit 1
else
	rm "$WALLPAPER_DIR/wallpaper-new.jpg"
	exit 0
fi
