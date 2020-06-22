FROM debian:buster-slim  as base

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    file \
    git \
    gfortran \
    libatlas-base-dev \
    libboost-filesystem-dev \
    libboost-iostreams-dev \
    libopenmpi-dev \
    libsuperlu-dev \
    libssl-dev \
    libxml2-dev \
    libyaml-cpp-dev \
    wget \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
