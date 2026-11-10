#!/bin/sh
echo "Installing QCM"
set -e
REPO_URL="https://github.com/Youg-Otricked/quartic-c-manager.git"
INSTALL_DIR="$(mktemp -d)"
trap 'rm -rf "$INSTALL_DIR"' 0 1 2 15
git clone "$REPO_URL" "$INSTALL_DIR"
cd "$INSTALL_DIR"
clang++ -O3 -DCPPHTTPLIB_SSL_ENABLED main.cpp -std=c++23 -lssl -lcrypto -o ~/qcm
cd ~
echo "Installed. Setting up."
./qcm setup
chmod +x ~/.qcm/bin/qcm
echo "Done"
