#! /bin/bash

PWD=$(pwd)
echo "Copying desktop config..."

echo "Copying..."
rsync -a "$PWD/plasma/config/" "$HOME/.config/"
cp -r "$PWD/assets/icons" "$HOME/.icons"

echo "Desktop config setup done."
