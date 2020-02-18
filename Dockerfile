FROM ubuntu:18.04

# do do use dialog prompts when installing packages
ENV DEBIAN_FRONTEND noninteractive

# install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    locales \
    software-properties-common

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ffmpeg \
    gnupg \
    libavahi-compat-libdnssd-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get update && apt-get install -y --no-install-recommends \
    nodejs

RUN npm install -g --unsafe-perm homebridge
RUN npm install -g homebridge-camera-ffmpeg
RUN npm install -g --unsafe-perm homebridge-config-ui-x

ENTRYPOINT /usr/bin/homebridge -U /config | tee /var/log/homebridge.log
