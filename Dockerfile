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
RUN apt-get -y install nano

# Remove unecessary files
#RUN apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

