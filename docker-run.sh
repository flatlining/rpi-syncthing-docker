#!/bin/bash

docker run -d -v $HOME/docker-data/sync/config:/syncthing/config -v $HOME/docker-data/sync/data:/syncthing/data -p 22000:22000  -p 21025:21025/udp -p 8080:8080 --name syncthing rpi-syncthing:arm
