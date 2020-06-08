FROM danger89/cmake:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends vim googletest gcovr \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
