FROM resin/rpi-raspbian
MAINTAINER Matias Schertel <mschertel@gmail.com>

# Environment
ENV DEBIAN_FRONTEND noninteractive

# Upgrade system
RUN apt-get update && apt-get upgrade -y

# Install debconf
RUN apt-get -y install apt-utils

# Locale config
RUN apt-get -y install locales && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales

# Install apps
RUN apt-get -y install curl apt-transport-https && \
    curl -s https://syncthing.net/release-key.txt | sudo apt-key add - && \
    echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list && \
    apt-get update && \
    apt-get -y install syncthing

RUN apt-get -y install screen syncthing-inotify

# Remove unecessary files
#RUN apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose poers
EXPOSE 8080 22000 21025/udp

# Create folders
RUN mkdir -p /syncthing/config && \
    mkdir -p /syncthing/data
VOLUME ["/syncthing/config", "/syncthing/data"]

# inotify usage
ENV USE_INOTIFY 0

# Add command
ADD init /syncthing/init
RUN chmod 770 /syncthing/init
CMD ["/syncthing/init"]
