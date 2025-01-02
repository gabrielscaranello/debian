#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/system-packages")

echo "Installing native packages..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y "$PACKAGES"
echo "Native packages installed."
