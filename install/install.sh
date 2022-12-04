#!/bin/bash

# This script installs Kiwix, Home Assistant, and Jellyfin dependeing on your operating system. [Linux, Darwin, Raspbian]
# Docker and Docker-Compose will be installed from ./scripts/docker_install.sh
# Each application will be installed from ./scripts/kiwix.sh, ./scripts/homeassistant.sh, and ./scripts/jellyfin.sh

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # make and change to the install directory
    mkdir ~/homekit-server/install
    cd ~/homekit-server/install

    # run the docker install script
    sudo chmod +x ~/homekit-server/install/scripts/docker_install.sh
    ~/homekit-server/install/scripts/docker_install.sh

    # run the kiwix install script
    sudo chmod +x ~/homekit-server/install/scripts/debian/kiwix.sh
    ~/homekit-server/install/scripts/debian/kiwix.sh

    # run the homeassistant install script
    sudo chmod +x ~/homekit-server/install/scripts/debian/homeassistant.sh
    ~/homekit-server/install/scripts/debian/homeassistant.sh

    # run the jellyfin install script
    sudo chmod +x ~/homekit-server/install/scripts/debian/jellyfin.sh
    ~/homekit-server/install/scripts/debian/jellyfin.sh


# MacOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # make and change to the install directory
    mkdir ~/homekit-server/install
    cd ~/homekit-server/install

    # run the docker install script
    sudo chmod +x ~/homekit-server/install/scripts/docker_install.sh
    ~/homekit-server/install/scripts/docker_install.sh

    # run the kiwix install script
    sudo chmod +x ~/homekit-server/install/scripts/macos/kiwix.sh
    ~/homekit-server/install/scripts/macos/kiwix.sh

    # run the homeassistant install script
    sudo chmod +x ~/homekit-server/install/scripts/macos/homeassistant.sh
    ~/homekit-server/install/scripts/macos/homeassistant.sh

    # run the jellyfin install script
    sudo chmod +x ~/homekit-server/install/scripts/macos/jellyfin.sh
    ~/homekit-server/install/scripts/macos/jellyfin.sh


# Rasbian
elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    # make and change to the install directory
    mkdir ~/homekit-server/install
    cd ~/homekit-server/install

    # run the docker install script
    sudo chmod +x ~/homekit-server/install/scripts/docker_install.sh
    ~/homekit-server/install/scripts/docker_install.sh

    # run the kiwix install script
    sudo chmod +x ~/homekit-server/install/scripts/raspbian/kiwix.sh
    ~/homekit-server/install/scripts/raspbian/kiwix.sh

    # run the homeassistant install script
    sudo chmod +x ~/homekit-server/install/scripts/raspbian/homeassistant.sh
    ~/homekit-server/install/scripts/raspbian/homeassistant.sh

    # run the jellyfin install script
    sudo chmod +x ~/homekit-server/install/scripts/raspbian/jellyfin.sh
    ~/homekit-server/install/scripts/raspbian/jellyfin.sh

else
    echo "Oh no... it looks likeyour operating system is not supported 🗿"
    echo "If you think this is an error, please open an issue on GitHub."
fi
