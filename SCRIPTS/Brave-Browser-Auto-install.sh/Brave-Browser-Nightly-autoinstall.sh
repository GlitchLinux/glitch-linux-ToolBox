#!/bin/bash

# Exit script if any command fails
set -e

# Update package list and install curl if not already installed
if ! command -v curl &> /dev/null; then
    echo "curl not found. Installing curl..."
    sudo apt update
    sudo apt install -y curl
fi

# Add Brave Nightly GPG key
echo "Adding Brave Nightly GPG key..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg

# Add Brave Nightly repository
echo "Adding Brave Nightly repository..."
echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg] https://brave-browser-apt-nightly.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list

# Update package list
echo "Updating package list..."
sudo apt update

# Install Brave Nightly
echo "Installing Brave Nightly..."
sudo apt install -y brave-browser-nightly

# Launch Brave Nightly
echo "Launching Brave Nightly..."
brave-browser-nightly &

echo "Brave Nightly installation and launch complete!"
