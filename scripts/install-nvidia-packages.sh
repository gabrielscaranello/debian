#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/nvidia-packages" | tr '\n' ' ')

. $PWD/scripts/_utils.sh

echo "Installing Nvidia packages..."
install_nala
sudo nala upgrade -y
sudo nala install -y $PACKAGES
echo "native Nvidia installed."
