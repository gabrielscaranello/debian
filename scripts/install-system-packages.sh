#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/system-packages" | tr '\n' ' ')

echo "Installing native packages..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES
echo "Native packages installed."

echo "Enabling Flatpak..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Flatpak enabled."
