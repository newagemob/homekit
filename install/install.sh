#!/bin/bash

# This script installs Kiwix, Home Assistant, and Jellyfin dependeing on your operating system. [Linux, MacOS, Windows]
# Docker and Docker-Compose will be installed from ./scripts/docker_install.sh
# Each application will be installed from ./scripts/kiwix.sh, ./scripts/homeassistant.sh, and ./scripts/jellyfin.sh

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # make and change to the install directory
    mkdir ~/homekit-server/install
    cd ~/homekit-server/install

    # run the docker install script
    sudo chmod +x ./scripts/docker_install.sh
    sudo ./scripts/docker_install.sh

    # run the kiwix install script
    sudo chmod +x ./scripts/debian/kiwix.sh
    sudo ./scripts/debian/kiwix.sh

    # run the home assistant install script
    sudo chmod +x ./scripts/debian/homeassistant.sh
    sudo ./scripts/debian/homeassistant.sh

    # run the jellyfin install script
    sudo chmod +x ./scripts/debian/jellyfin.sh
    sudo ./scripts/debian/jellyfin.sh

# Raspberry Pi
elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    # make and change to the install directory
    mkdir ~/homekit-server/install
    cd ~/homekit-server/install

    # run the docker install script
    sudo chmod +x ./scripts/docker_install.sh
    sudo ./scripts/docker_install.sh

    # run the kiwix install script
    sudo chmod +x ./scripts/arm/kiwix.sh
    sudo ./scripts/arm/kiwix.sh

    # run the home assistant install script
    sudo chmod +x ./scripts/arm/homeassistant.sh
    sudo ./scripts/arm/homeassistant.sh

    # run the jellyfin install script
    sudo chmod +x ./scripts/arm/jellyfin.sh
    sudo ./scripts/arm/jellyfin.sh

# MacOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # make and change to the install directory
    mkdir ~/homekit-server/install
    cd ~/homekit-server/install

    # run the docker install script
    sudo chmod +x ./scripts/docker_install.sh
    sudo ./scripts/docker_install.sh

    # run the kiwix install script
    sudo chmod +x ./scripts/kiwix.sh
    sudo ./scripts/kiwix.sh

    # run the home assistant install script
    sudo chmod +x ./scripts/homeassistant.sh
    sudo ./scripts/homeassistant.sh

    # run the jellyfin install script
    sudo chmod +x ./scripts/jellyfin.sh
    sudo ./scripts/jellyfin.sh

    