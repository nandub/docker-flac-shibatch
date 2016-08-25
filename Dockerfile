FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get upgrade -qq
RUN apt-get install -y flac sox python-software-properties software-properties-common wget unzip
RUN add-apt-repository -y ppa:ssrc-packaging-group/ppa
RUN apt-get update
RUN apt-get install -y ssrc

RUN wget https://github.com/ronalde/flac-src-shibatch/archive/master.zip -O flac-shibatch.zip
RUN mkdir -p /flac/files
RUN unzip flac-shibatch.zip -d /flac
RUN mv /flac/flac-src-shibatch-master /flac/shibatch

WORKDIR /flac/shibatch
VOLUME /flac/files

CMD [ "./convert-flac", "/flac/files" ]
