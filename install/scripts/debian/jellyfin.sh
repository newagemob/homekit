#!/bin/bash
# Install Jellyfin (https://jellyfin.org/docs/general/administration/installing)
# TODO: create bind-mount instructions for config and cache

# DOCKER
docker pull jellyfin/jellyfin
docker volume create jellyfin-config
docker volume create jellyfin-cache

docker run -d \
  --name jellyfin \
  --user uid:gid \
  --net=host \
  --volume jellyfin-config:/config \ # Alternatively --volume /path/to/config:/config
--volume jellyfin-cache:/cache \ # Alternatively --volume /path/to/cache:/cache
--mount type=bind,source=/path/to/media,target=/media \
  --restart=unless-stopped \
  jellyfin/jellyfin

# DOCKER-COMPOSE
version: '3.5'
services:
jellyfin:
image: jellyfin/jellyfin
container_name: jellyfin
user: uid:gid
network_mode: 'host'
volumes:
- /path/to/config:/config
- /path/to/cache:/cache
- /path/to/media:/media
- /path/to/media2:/media2:ro
restart: 'unless-stopped'
# Optional - alternative address used for autodiscovery
environment:
- JELLYFIN_PublishedServerUrl=http://example.com
# Optional - may be necessary for docker healthcheck to pass if running in host network mode
extra_hosts:
- "host.docker.internal:host-gateway"

# Run the container
docker compose up -d
