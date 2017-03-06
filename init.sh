#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# if this if the first run, generate a useful config
if [ ! -f /syncthing/config/config.xml ]; then
  echo "generating config"
  syncthing --generate="/syncthing/config"
  # don't take the whole volume with the default so that we can add additional folders
  sed -e "s/id=\"default\" path=\"\/root\/Sync\"/id=\"default\" path=\"\/syncthing\/data\/default\"/" -i /syncthing/config/config.xml
  # ensure we can see the web ui outside of the docker container
	sed -e "s/<address>127.0.0.1:8384/<address>0.0.0.0:8080/" -i /syncthing/config/config.xml
fi

syncthing -home=/syncthing/config