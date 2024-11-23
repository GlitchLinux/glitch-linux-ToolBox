# install_torbrowser.sh

This script automates the process of downloading and installing Tor Browser on a Linux system. It downloads the Tor Browser tarball, extracts it, and launches the application in the background.

## Features

- Downloads Tor Browser version 14.0.2 from the official Tor Project website.
- Cleans up any existing installation in `/tmp/tor/` before starting the new installation.
- Extracts the downloaded tarball and prepares the application for use.
- Launches Tor Browser using the provided `start-tor-browser.desktop` file.
- The script runs Tor Browser in the background and disowns the process, ensuring it continues running after the terminal is closed.

## Requirements

- `curl` for downloading the Tor Browser tarball.
- `tar` for extracting the downloaded file.
- The script is designed to run on a Linux system.

## Installation

1. Download the `install_torbrowser.sh` script to your machine & execute it:

   You can clone the repository using `git`:

   ```bash
   mkdir /tmp/torbrowser/
   cd  /tmp/torbrowser/
   git clone https://github.com/GlitchLinux/Install-Tor-Browser.git
   cd Install-Tor-Browser
   bash install_torbrowser.sh
