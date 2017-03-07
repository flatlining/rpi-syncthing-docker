#!/bin/bash

sudo sh -c 'echo 204800 > /proc/sys/fs/inotify/max_user_watches'

docker run -d --name syncthing \
           --restart=always \
           -v $HOME/docker-data/sync/config:/syncthing/config \
           -v $HOME/docker-data/sync/data:/syncthing/data \
           -p 22000:22000 \
           -p 21025:21025/udp \
           -p 8080:8080 \
           rpi-syncthing:arm
