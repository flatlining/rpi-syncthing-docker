## Syncthing for Raspberry Pi

### Run

```bash
docker run -d --name syncthing \
           --restart=always \
           -v $HOME/docker-data/sync/config:/syncthing/config \
           -v $HOME/docker-data/sync/data:/syncthing/data \
           -p 22000:22000 \
           -p 21025:21025/udp \
           -p 8080:8080 \
           <image_name>
```

#### Troubleshooting for folders with many files on Linux

To avoid trouble with linux file limits for [inotify](https://github.com/syncthing/syncthing-inotify#troubleshooting-for-folders-with-many-files-on-linux) until next reboot, before running the container, execute:

```bash
sudo sh -c 'echo 204800 > /proc/sys/fs/inotify/max_user_watches'
```

### Inspirations

- https://github.com/ncadou/docker-syncthing
- https://github.com/joeybaker/docker-syncthing
- https://github.com/funkyfuture/docker-rpi-syncthing
