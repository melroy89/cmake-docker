FROM debian:buster-slim
LABEL maintainer="micha.hoiting@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get --allow-releaseinfo-change update
RUN apt-get install -y build-essential cmake libboost-all-dev pkg-config                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
RUN apt-get install -y ninja-build doxygen graphviz
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    python3-pip \
    ca-certificates \
    vim \
    curl \
    netbase \
    wget \
    gnupg \
    dirmngr \
    bzr \
    git \
    openssh-client \
    procps \
    rpm \
    sshpass \
    cppcheck \
    valgrind \
    gdb \
    googletest \
    gcovr \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip3 install cpplint

# set the locale to en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
