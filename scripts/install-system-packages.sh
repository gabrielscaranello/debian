#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/system-packages" | tr '\n' ' ')

echo "Installing native packages..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES
echo "Native packages installed."
