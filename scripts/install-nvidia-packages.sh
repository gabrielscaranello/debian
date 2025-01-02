#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/nvidia-packages")

echo "Installing Nvidia packages..."
sudo apt update
sudo apt upgrade -y
echo "$PACKAGES" | xargs sudo apt install -y
echo "native Nvidia installed."
