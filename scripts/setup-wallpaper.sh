#! /bin/bash

WALLPAPER_DIR=/usr/share/wallpapers/SpaceFun/gnome-background.xml

echo "Setting up Wallpaper..."

echo "Setting wallpaper..."
gsettings set org.gnome.desktop.background picture-uri "file://${WALLPAPER_DIR}"
gsettings set org.gnome.desktop.background picture-uri-dark "file://${WALLPAPER_DIR}"
gsettings set org.gnome.desktop.screensaver picture-uri "file://${WALLPAPER_DIR}"
