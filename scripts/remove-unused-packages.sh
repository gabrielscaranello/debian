#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/unused-packages")

echo "Removing unused packages..."
sudo apt update
sudo apt purge -y "$PACKAGES"
sudo apt autoremove --purge -y
echo "Unused packages removed."
