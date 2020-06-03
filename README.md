# Build environment for C++ projects using CMake.

All the packages you will ever need to build your C++ code with [CMake](https://cmake.org/) in Docker.
Optionally using the [Ninja build system](https://ninja-build.org/) and [Boost libaries](https://www.boost.org/).

Including test packages (like `cppcheck`, `cpplint` and `doxygen`). Also `gdb`, `valgrind` and `dot` (generating directed graphs) are installed.

## Installation

1. Install [Docker](https://www.docker.com/)

2. Pull the image directly from DockerHub:

```sh
docker pull mhoiting/cmake
```

## Usage

Ideally use this container within a CI/CD pipeline of your choice.

Alternatively, you could use it interactively: `docker run -it -v <host_dir>:<container_dir> mhoiting/cmake /bin/bash`.

## Build

Building the image yourself is also possible, via:

```sh
docker build --tag mhoiting/cmake .
```
