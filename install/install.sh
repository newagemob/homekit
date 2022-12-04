#!/bin/bash

# This script installs Kiwix, Home Assistant, and Jellyfin dependeing on your operating system. [Linux, MacOS, Windows]

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # make and change to the install directory
    mkdir ~/homekit-server/install
    cd ~/homekit-server/install
    # Kiwix
    wget https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop_x86_64.appimage # Install Kiwix (https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop_x86_64.appimage)
    chmod +x kiwix-desktop_x86_64.appimage # Make Kiwix executable
    # ./kiwix-desktop_x86_64.appimage # Run Kiwix
    # create a systemctl service for Kiwix
    sudo touch /etc/systemd/system/kiwix.service
    sudo echo "[Unit]
    Description=Kiwix
    After=network.target

    [Service]
    Type=simple
    ExecStart=/home/pi/homekit-server/install/kiwix-desktop_x86_64.appimage
    Restart=on-failure
    RestartSec=10s

    [Install]
    WantedBy=multi-user.target" > /etc/systemd/system/kiwix.service
    sudo systemctl enable kiwix.service # Enable Kiwix service

    # Install Home Assistant with Git (https://github.com/home-assistant/core.git)
    git clone https://github.com/home-assistant/core.git
    cd core


    # Install Jellyfin
    sudo apt-get install jellyfin
