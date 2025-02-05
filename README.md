# Cmake, Ninja, Boost, cppcheck/cpplint, Doxygen Docker Image

All the packages you will ever need to build your modern C++ code with [Cmake](https://cmake.org/) in a Docker container. Based on Debian Bookworm slim.

Optionally you can use the [Ninja build system](https://ninja-build.org/) and [Boost libraries](https://www.boost.org/).

The image also includes test tools (like `cppcheck`, `cpplint` and `doxygen`).  
This Docker image also contains other useful programs, like: `gdb`, `valgrind`, `clang-format` and `dot` (generating directed graphs) are installed.

## Installation

1. Install [Docker](https://www.docker.com/)

2. Pull the image directly from DockerHub:

```sh
docker pull danger89/cmake:latest
```

Or use a specific tag:

```sh
docker pull danger89/cmake:5.3
```

**Note:** Since tag `4.0` and until tag `4.6`, Debian Bullseye was used for GCC 10 compiler.

**Note:** Since tag `4.4` and higher, we build cppcheck ourselves, so we get the [latest stable cppcheck](https://cppcheck.sourceforge.io/).

**Important:** Since tag `5.0` and higher (including `latest` tag) the base image is now based on Debian Bookworm instead of Bullseye. We're now using GCC/G++ v12 with CMake v3.25.

## Usage

Ideally, use this Docker image within a CI/CD pipeline of your choice.

Alternatively, you could use: `docker run danger89/cmake`. Mount any volume via `-t` option on your host OS, like the `/root` folder.

## Build

Building the image yourself is also possible (but _not_ required), via:

```sh
docker build --tag danger89/cmake .
```
