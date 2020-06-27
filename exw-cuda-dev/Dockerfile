FROM nvidia/cuda:10.2-devel as base

ARG CMAKE_VERSION=3.17.3
RUN (\
    curl -fsSL --output cmake-${CMAKE_VERSION}.tar.gz https://github.com/Kitware/CMake/archive/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz \
    && tar -xzf cmake-${CMAKE_VERSION}.tar.gz \
    && cd CMake-${CMAKE_VERSION} \
    && ./bootstrap -- -DCMAKE_USE_OPENSSL=OFF \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf CMake-${CMAKE_VERSION} \
    && rm cmake-${CMAKE_VERSION}.tar.gz \
    )

ARG NINJA_VERSION=1.10.0
RUN (\
    curl -fsSL --output ninja-${NINJA_VERSION}.tar.gz https://github.com/ninja-build/ninja/archive/v${NINJA_VERSION}.tar.gz \
    && tar -xzf ninja-${NINJA_VERSION}.tar.gz \
    && cd ninja-${NINJA_VERSION} \
    && cmake -Bbuild . \
    && cd build \
    && make -j$(nproc) \
    && cp ninja /usr/local/bin \
    && cd ../.. \
    && rm -rf ninja-${NINJA_VERSION} \
    && rm  ninja-${NINJA_VERSION}.tar.gz \
    )

RUN apt-get update && apt-get install -y --no-install-recommends gfortran \
    && rm -rf /var/lib/apt/lists/*
