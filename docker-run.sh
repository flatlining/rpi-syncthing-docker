#!/bin/bash

sudo sh -c 'echo 204800 > /proc/sys/fs/inotify/max_user_watches'

DOCKER_CONFIGS="$(echo $HOME/docker-data/syncthing)"

docker run -d --name syncthing \
           --restart=always \
           -v "${DOCKER_CONFIGS}/config:/syncthing/config" \
           -v "${DOCKER_CONFIGS}/data:/syncthing/data" \
           -p 22000:22000 \
           -p 21025:21025/udp \
           -p 8080:8080 \
           -e USE_INOTIFY=1 \
           flatlining/syncthing:arm
