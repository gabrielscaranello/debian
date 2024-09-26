#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/system-packages" | tr '\n' ' ')

. $PWD/scripts/_utils.sh

echo "Installing native packages..."
install_nala
sudo nala upgrade -y
sudo nala install -y $PACKAGES
echo "Native packages installed."

echo "Enabling Flatpak..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Flatpak enabled."
