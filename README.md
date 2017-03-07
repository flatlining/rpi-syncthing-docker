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

### Inspirations

- https://github.com/ncadou/docker-syncthing
- https://github.com/joeybaker/docker-syncthing
- https://github.com/funkyfuture/docker-rpi-syncthing
