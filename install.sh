#!/usr/bin/env bash

INSTALL_DIR="/opt/system-health-shielder"
BIN_LINK="/usr/local/bin/system-health-shielder"

# Check if the script is run as root
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run as root"
    exit 1
fi