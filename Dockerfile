FROM debian:bookworm AS base-build

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update \
    && apt-get --no-install-recommends install -y \
        apt-transport-https ca-certificates \
        attr bc build-essential \
        curl file gawk \
        git gperf jq \ 
        libhtml-parser-perl libjson-perl libncurses-dev \
        libssl-dev libxml-libxml-perl lzip \
        python3 subversion unzip zlib1g-dev \
        xxd protobuf-c-compiler kmod bsdmainutils \
    && update-ca-certificates

RUN useradd -u 1001 -ms /bin/bash build
VOLUME /workspace
USER build
WORKDIR /workspace
