#!/bin/bash

WEBPAGE="https://apod.nasa.gov/apod"
WALLPAPER_DIR=~/.config/i3/wallpaper
mkdir -p "$WALLPAPER_DIR"

IMAGE=$(curl -s "$WEBPAGE/astropix.html" | perl -ne 'print $1 if m|<a href="(image/[^"]+)"|')
wget -q -b "$WEBPAGE/$IMAGE" -O "$WALLPAPER_DIR/wallpaper-new.jpg"

# Only replace file, if newer. (if checksum does not match)
if [ $(! test -f "$WALLPAPER_DIR/wallpaper.jpg")] 
then
	if [$(md5sum "$WALLPAPER_DIR/wallpaper.jpg" -eq md5sum "$WALLPAPER_DIR/wallpaper-new.jpg")]
	then
		mv -f "$WALLPAPER_DIR/wallpaper-new.jpg" "$WALLPAPER_DIR/wallpaper.jpg"
	else
		rm "$WALLPAPER_DIR/wallpaper.jpg"
	fi
else
	mv -f "$WALLPAPER_DIR/wallpaper-new.jpg" "$WALLPAPER_DIR/wallpaper.jpg"
fi
