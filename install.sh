#!/usr/bin/env bash

INSTALL_DIR="/opt/system-health-shielder"
BIN_LINK="/usr/local/bin/system-health-shielder"

# Check if the script is run as root
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run as root"
    exit 1
fi

echo "[\e[32mINFO\e[0m] Installing System Health Shielder..."
# Create installation directory
mkdir -p "$INSTALL_DIR"
# Copy files to the installation directory
cp -r ./* "$INSTALL_DIR"

chmod +x "$INSTALL_DIR/main.sh"