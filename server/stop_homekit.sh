#!/bin/bash

DIRECTORY=$PWD # TODO: setup cases for mac and windows shell commands

for subdirectory in "$DIRECTORY"/*/; do
  if [[ "$subdirectory" != "$DIRECTORY/media-server/" ]]; then
    cd "$subdirectory"
    docker-compose down -v
  fi
done
