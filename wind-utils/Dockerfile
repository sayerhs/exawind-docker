FROM exawind/exw-trilinos AS trilinos
FROM exawind/exw-dev-deps AS base

COPY --from=trilinos /opt/exawind /opt/exawind

ARG ENABLE_OPENMP=OFF
ARG ENABLE_CUDA=OFF

RUN (\
    git clone --depth 1 https://github.com/exawind/wind-utils.git \
    && cd wind-utils \
    && cmake \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_PREFIX_PATH=/opt/exawind \
        -DCMAKE_INSTALL_PREFIX=/opt/exawind \
        -DBUILD_SHARED_LIBS=ON \
        -DENABLE_HYPRE=OFF \
        -G Ninja . \
    && cd build \
    && ninja -j$(nproc) \
    && ninja install \
    && cd ../.. \
    && rm -rf wind-utils \
    && cd /opt/exawind/lib \
    && ls *so* | xargs strip -s \
    && echo "/opt/exawind/lib" > /etc/ld.so.conf.d/exawind.conf \
    && ldconfig \
    )

FROM exawind/exw-osrun as runner

COPY --from=base /usr/local /usr/local
COPY --from=trilinos /opt/exawind /opt/exawind

RUN (\
    echo "/opt/exawind/lib" > /etc/ld.so.conf.d/exawind.conf \
    && ldconfig \
    )

ENV PATH /opt/exawind/bin:${PATH}
