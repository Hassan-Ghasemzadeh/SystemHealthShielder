#!/usr/bin/env bash


INSTALL_DIR="/opt/system-health-shielder"

BIN_LINK="/usr/local/bin/system-health-shielder"

# Check if the script is run as root
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run as root"
    exit 1
fi

echo "Installing System Health Shielder..."
# Create installation directory
mkdir -p "$INSTALL_DIR"
# Copy files to the installation directory
cp -rf ./* "$INSTALL_DIR"

# Make the main script executable
chmod +x "$INSTALL_DIR/main.sh"

# Create a symbolic link to the main script in /usr/local/bin
ln -sf "$INSTALL_DIR/main.sh" "$BIN_LINK"


echo "Installation completed successfully!"
echo "You can run the tool using: system-health-shielder"