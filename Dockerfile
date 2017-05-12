FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    flac \
    python-software-properties \
    software-properties-common \
    sox \
    unzip \
    wget

RUN add-apt-repository -y ppa:ssrc-packaging-group/ppa
RUN apt-get update && apt-get install -y --no-install-recommends ssrc \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/ronalde/flac-src-shibatch/archive/master.zip -O flac-shibatch.zip
RUN mkdir -p /flac/files
RUN unzip flac-shibatch.zip -d /flac
RUN mv /flac/flac-src-shibatch-master /flac/shibatch

WORKDIR /flac/shibatch
VOLUME /flac/files

ENTRYPOINT ["./convert-flac"]
CMD ["/flac/files"]
