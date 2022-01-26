# Cmake, Ninja, Boost, cppcheck/cpplint, Doxygen Docker Image

All the packages you will ever need to build your C++ code with [Cmake](https://cmake.org/) in a Docker container. Based on Debian Buster slim.

Optionally you can use the [Ninja build system](https://ninja-build.org/) and [Boost libaries](https://www.boost.org/).

Image also includes test tools (like `cppcheck`, `cpplint` and `doxygen`).  
This Docker image also contains other useful programs, like: `gdb`, `valgrind`, `clang-format` and `dot` (generating directed graphs) are installed.

## Installation

1. Install [Docker](https://www.docker.com/)

2. Pull the image directly from DockerHub:

```sh
docker pull danger89/cmake:latest
```

**Important:** Since tag `4.0` and higher (including `latest`), we will use Debian Bullseye Testing for GCC 10 compiler.

*Note:* Select a specific version via: `danger89/cmake:3.0`

## Usage

Ideally use this container within a CI/CD pipeline of your choice.

Alternatively, you could use: `docker run danger89/cmake`. Mount any volume via `-t` option on your host OS, like the `/root` folder.

## Build

Building the image yourself is also possible, via:

```sh
docker build --tag danger89/cmake .
```

