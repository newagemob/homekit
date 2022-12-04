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
    sudo systemctl start kiwix.service # Start Kiwix service


    # Install Home Assistant (https://www.home-assistant.io/installation/)
    # Need to install Docker and Docker Compose first
    # Install Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    # Add the user to the docker group
    sudo usermod -aG docker $USER

    # Install Docker Compose
    sudo apt-get install -y libffi-dev libssl-dev
    sudo apt-get install -y python3 python3-pip
    sudo apt-get remove python-configparser
    sudo pip3 -v install docker-compose

    # Install Home Assistant
    sudo mkdir /opt/homeassistant
    sudo chown $USER:$USER /opt/homeassistant
    cd /opt/homeassistant
    sudo docker-compose run --rm homeassistant
    sudo docker-compose up -d
    sudo docker-compose logs -f


    # Install Jellyfin (https://jellyfin.org/docs/general/administration/installing)
    # TODO: create bind-mount instructions for config and cache
    docker pull jellyfin/jellyfin
    docker volume create jellyfin-config
    docker volume create jellyfin-cache

    docker run -d \
    --name jellyfin \
    --user uid:gid \
    --net=host \
    --volume jellyfin-config:/config \ # Alternatively --volume /path/to/config:/config 
    --volume jellyfin-cache:/cache \ # Alternatively  --volume /path/to/cache:/cache
    --mount type=bind,source=/path/to/media,target=/media \
    --restart=unless-stopped \
    jellyfin/jellyfin
