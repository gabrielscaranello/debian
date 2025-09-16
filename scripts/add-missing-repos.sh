#! /bin/bash

PWD=$(pwd)

_add_contrib_nonfree_repo() {
  echo "Add contrib and non-free repository..."
  sudo sed -r -i 's/^deb(.*) main non-free-firmware$/deb\1 main contrib non-free non-free-firmware/g' /etc/apt/sources.list
  echo "Contrib and non-free repository added."
}

_add_firefox_repo() {
  echo "Adding Firefox repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/keyrings/packages.mozilla.org.asc /etc/apt/sources.list.d/mozilla.list

  echo "Adding Firefox repo..."
  wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
  cat <<EOF | sudo tee /etc/apt/sources.list.d/mozilla.sources >/dev/null
Types: deb
URIs: https://packages.mozilla.org/apt
Suites: mozilla
Components: main
Signed-By: /etc/apt/keyrings/packages.mozilla.org.asc
EOF

  echo "Firefox repo added."
}

_add_vscode_repo() {
  echo "Adding VSCode repo..."
  echo "Removing old files if exists..."
  sudo rm -rf /etc/apt/sources.list.d/vscode.sources /usr/share/keyrings/microsoft.gpg

  echo "Adding VSCode repo..."
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
  cat << EOF | sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

  rm -f microsoft.gpg
  echo "VSCode repo added."
}

echo "Adding missing deb repos..."
_add_contrib_nonfree_repo
_add_firefox_repo
_add_vscode_repo

sudo apt update
echo "Missing deb repos added."
