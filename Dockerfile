FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    flac \
    python-software-properties \
    software-properties-common \
    sox \
    unzip \
    wget

RUN add-apt-repository -y ppa:ssrc-packaging-group/ppa \
    && apt-get update && apt-get install -y --no-install-recommends ssrc \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/ronalde/flac-src-shibatch/archive/master.zip -O flac-shibatch.zip \
    && mkdir -p /flac/files \
    && unzip flac-shibatch.zip -d /flac \
    && mv /flac/flac-src-shibatch-master /flac/shibatch

WORKDIR /flac/shibatch
VOLUME /flac/files

ENTRYPOINT ["./convert-flac"]
CMD ["/flac/files"]
