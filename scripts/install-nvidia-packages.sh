#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/nvidia-packages")

echo "Installing Nvidia packages..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y "$PACKAGES"
echo "native Nvidia installed."
