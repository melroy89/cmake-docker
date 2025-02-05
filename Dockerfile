FROM debian:bookworm-slim
LABEL maintainer="melroy@melroy.org"

ENV DEBIAN_FRONTEND=noninteractive

# APT Update
RUN apt-get --allow-releaseinfo-change update
RUN apt-get update && apt-get upgrade -y

# APT install (base) packages
RUN apt-get install -y build-essential cmake libboost-all-dev pkg-config
RUN apt-get install -y ninja-build doxygen graphviz
RUN apt-get install -y --no-install-recommends curl wget

# Get cppcheck dependencies from stable; that's good enough
RUN echo "deb-src http://deb.debian.org/debian bookworm main" >>/etc/apt/sources.list
RUN apt-get update
RUN apt-get build-dep -y cppcheck
# Download cppcheck source code, build and install
RUN wget -O cppcheck.tar.gz https://github.com/danmar/cppcheck/archive/2.16.0.tar.gz
RUN tar -xvzf cppcheck.tar.gz
RUN cd cppcheck-2.16.0 && \
    mkdir build && \
    cd build && \
    cmake -DUSE_MATCHCOMPILER=ON .. && \
    cmake --build . -- -j 25 && \
    cmake --install .

# APT install additional packages
RUN apt-get install -y --no-install-recommends \
    locales \
    python3-pip \
    ca-certificates \
    netbase \
    gnupg \
    dirmngr \
    git \
    openssh-client \
    rpm \
    sshpass \
    valgrind \
    gdb \
    clang-format \
    libssl-dev && \
    apt-get clean

# Install cpplint via pip
RUN pip3 install cpplint --break-system-packages
# Clean-up
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Clean-up manual build(s)
RUN rm -rf cppcheck.tar.gz && rm -rf cppcheck-2.16.0

# set the locale to en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >/etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
