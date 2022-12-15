#!/bin/bash

# Install Home Assistant Docker Image (https://hub.docker.com/r/homeassistant/home-assistant)

# create directories for jellyfin bind mounts [cache, config, media]
mkdir -p ~/Developer/homekit/server/homeassistant/cache && mkdir -p ~/Developer/homekit/server/homeassistant/config && mkdir -p ~/Developer/homekit/server/homeassistant/db
cd ~/Developer/homekit/server/homeassistant

# check if home assistant container exists, if so, skip this step
if [[ "$(docker ps -a | grep home-assistant)" == "" ]]; then
  docker pull homeassistant/home-assistant
  # call docker-compose from ../../../server/home-assistant
  docker compose up -d
else
  docker compose up -d
fi
