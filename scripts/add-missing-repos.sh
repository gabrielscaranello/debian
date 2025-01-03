#! /bin/bash

PWD=$(pwd)

_add_contrib_nonfree_repo() {
  echo "Add contrib and non-free repository..."
  sudo apt-add-repository contrib non-free -y
  echo "Contrib and non-free repository added."
}

_add_docker_repo() {
  echo "Adding Docker repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/keyrings/docker.gpg /etc/apt/sources.list.d/docker.list

  echo "Adding Docker repo..."
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

  echo "Docker repo added."
}

_add_firefox_repo() {
  echo "Adding Firefox repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/keyrings/packages.mozilla.org.asc /etc/apt/sources.list.d/mozilla.list

  echo "Adding Firefox repo..."
  wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc >/dev/null
  echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list >/dev/null

  echo "Firefox repo added."
}

_add_papirus_repo() {
  echo "Adding Papirus repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/sources.list.d/papirus-ppa.list /etc/apt/trusted.gpg.d/papirus-ppa.asc

  echo "Adding Papirus repo..."
  sudo sh -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu jammy main' > /etc/apt/sources.list.d/papirus-ppa.list"
  sudo wget -qO /etc/apt/trusted.gpg.d/papirus-ppa.asc 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9461999446FAF0DF770BFC9AE58A9D36647CAE7F'

  echo "Papirus repo added."
}

_add_vscode_repo() {
  echo "Adding VSCode repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/sources.list.d/vscode.list /etc/apt/keyrings/packages.microsoft.gpg

  echo "Adding VSCode repo..."
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  echo "VSCode repo added."
}

echo "Adding missing deb repos..."
_add_contrib_nonfree_repo
_add_docker_repo
_add_firefox_repo
_add_papirus_repo
_add_vscode_repo

sudo apt update
echo "Missing deb repos added."
