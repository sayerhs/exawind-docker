FROM debian:buster-slim as base

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libatlas3-base \
    libboost-filesystem1.67 \
    libboost-iostreams1.67 \
    libgfortran-8-dev \
    libopenmpi3 \
    libsuperlu5 \
    libxml2 \
    libyaml-cpp0.6 \
    openmpi-bin \
    zlib1g \
    && rm -rf /var/lib/apt/lists/*
