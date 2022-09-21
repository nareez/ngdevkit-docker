FROM amd64/ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "deb [trusted=yes] http://ppa.launchpad.net/dciabrin/ngdevkit/ubuntu focal main" > /etc/apt/sources.list.d/ppa-ngdevkit.list

RUN apt update && \
    apt install -y wget make ngdevkit pkg-config autoconf zip imagemagick sox libsox-fmt-mp3

RUN apt -y purge wget && apt -y autoremove && apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /src

WORKDIR /src

#ENTRYPOINT [ "make" ]
