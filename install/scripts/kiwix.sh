#!/bin/bash

# Kiwix

mkdir -p ~/Developer/homekit/server/kiwix

# check OS and install kiwix for that OS
# linux and raspbian
if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    wget https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop_x86_64.appimage # Install Kiwix     (https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop_x86_64.appimage)
    chmod +x kiwix-desktop_x86_64.appimage                                              # Make Kiwix    executable

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
        WantedBy=multi-user.target" >/etc/systemd/system/kiwix.service
    sudo systemctl enable kiwix.service # Enable Kiwix service
    sudo systemctl start kiwix.service  # Start Kiwix service

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # use https://download.kiwix.org/release/kiwix-desktop-macos/kiwix-desktop-macos.dmg to install Kiwix
    open https://download.kiwix.org/release/kiwix-desktop-macos/kiwix-desktop-macos.dmg
    # move Kiwix to /Applications
    mv ~/Downloads/kiwix-desktop-macos.dmg /Applications

else
    echo "OS not supported"
fi

