#! /bin/bash

PWD=$(pwd)
VERSION=$(curl -s https://api.github.com/repos/lassekongo83/adw-gtk3/releases/latest | grep "tag_name" | cut -d '"' -f 4)
FILE_NAME="adw-gtk3$VERSION.tar.xz"
OUTPUT_DIR="/tmp/$FILE_NAME"
DOWNLOAD_URL="https://github.com/lassekongo83/adw-gtk3/releases/download/$VERSION/$FILE_NAME"
EXTRACT_DIR="/tmp/adw"
TARGET_DIR="/usr/share/themes"

echo "Setting up GTK Theme..."

echo "Removing old files if exists..."
sudo rm -rf "$TARGET_DIR/adw-*"
sudo rm -rf "$OUTPUT_DIR"

echo "Downloading GTK Theme..."
wget -c "$DOWNLOAD_URL" -O "$OUTPUT_DIR"

echo "Installing GTK Theme..."
mkdir -p "$EXTRACT_DIR"
tar -xf "$OUTPUT_DIR" -C "$EXTRACT_DIR"
sudo mv "$EXTRACT_DIR/adw-gtk3" "$EXTRACT_DIR/adw-gtk3-dark" "$TARGET_DIR/"

echo "Installing GTK Theme for flatpak..."
flatpak install flathub -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

echo "Defining GTK Theme..."
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
gsettings set org.gnome.desktop.wm.preferences theme "adw-gtk3-dark"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "GTK Theme setup done."
