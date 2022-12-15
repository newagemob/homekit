#!/bin/bash

# This script installs Kiwix, Home Assistant, and Jellyfin. It also installs Docker and Docker-Compose.
# Each application will be installed from ./scripts/[app_name].sh
# Docker and Docker-Compose will be installed from ./scripts/docker_install.sh

# check for Developer directory
if [[ ! -d ~/Developer ]]; then
  mkdir -p ~/Developer
fi

mv $PWD ~/Developer

cd ~/Developer/homekit

# Install Docker and Docker-Compose
chmod +x ./scripts/docker_install.sh
./scripts/docker_install.sh

# Install Home Assistant
chmod +x ./scripts/homeassistant.sh
./scripts/homeassistant.sh

# Install Jellyfin
chmod +x ./scripts/jellyfin.sh
./scripts/jellyfin.sh

# Install Kiwix
chmod +x ./scripts/kiwix.sh
./scripts/kiwix.sh
