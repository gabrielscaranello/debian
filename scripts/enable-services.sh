#! /bin/bash

echo "Enabling services..."

sudo systemctl enable --now docker
sudo systemctl enable --now packagekit
sudo systemctl enable --now ufw
sudo ufw enable

echo "Services enabled."
