#!/bin/bash

# Install Jellyfin Docker Image (https://jellyfin.org/docs/general/administration/installing)

# create directories for jellyfin bind mounts [cache, config, media]
mkdir -p ~/Developer/homekit/server/jellyfin/cache && mkdir -p ~/Developer/homekit/server/jellyfin/config && mkdir -p ~/Developer/homekit/server/jellyfin/media
cd ~/Developer/homekit/server/jellyfin

# check if jellyfin container exists, if so, skip this step
if [[ "$(docker ps -a | grep jellyfin)" == "" ]]; then
  docker pull jellyfin/jellyfin
  # call docker-compose from ../../../server/jellyfin
  docker compose up -d
else
  docker compose up -d
fi

# Run the container
cd ~/Developer/homekit/server/jellyfin && docker compose up -d
