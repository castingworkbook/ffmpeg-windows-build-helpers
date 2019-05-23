FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
    wget \
    ed \
    subversion \
    curl \
    texinfo \
    g++ \
    bison \
    flex \
    cvs \
    yasm \
    automake \
    libtool \
    autoconf \
    gcc \
    cmake \
    git \
    make \
    pkg-config \
    zlib1g-dev \
    mercurial \
    unzip \
    pax \
    nasm \
    gperf \
    autogen \
    bzip2 \
    autoconf-archive \
    p7zip-full

RUN apt-get install -y dos2unix lsb-release ragel
RUN apt-get install -y python3-distutils

COPY . ./ffmpeg-windows-build-helpers

#COPY ./do-custom-build.sh /ffmpeg-windows-build-helpers/do-custom-build.sh

WORKDIR /ffmpeg-windows-build-helpers

RUN find ./docker/ -type f -exec dos2unix '{}' \; && \
    find ./patches/ -type f -exec dos2unix '{}' \; && \
    dos2unix ./cross_compile_ffmpeg.sh

ENTRYPOINT [ "bash", "./docker/docker-entry.sh" ]
