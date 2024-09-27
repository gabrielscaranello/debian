#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/nvidia-packages" | tr '\n' ' ')

echo "Installing Nvidia packages..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES
echo "native Nvidia installed."
