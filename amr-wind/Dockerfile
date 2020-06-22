FROM exawind/exw-dev-deps as base

RUN (\
    git clone --depth 1 --recurse-submodules https://github.com/exawind/amr-wind.git \
    && cd amr-wind \
    && mkdir build \
    && cd build \
    && cmake \
       -DCMAKE_INSTALL_PREFIX=/opt/exawind \
       -DAMR_WIND_ENABLE_MPI=ON \
       -DAMR_WIND_ENABLE_OPENMP=OFF \
       -DAMR_WIND_ENABLE_MASA=OFF \
       -DAMR_WIND_ENABLE_TESTS=OFF .. \
    && make -j$(nproc) \
    && make install \
    && cd ../.. \
    && rm -rf amr-wind \
    && echo "/opt/exawind/lib" > /etc/ld.so.conf.d/exawind.conf \
    && ldconfig \
    )

FROM exawind/exw-osrun as runner

COPY --from=base /usr/local /usr/local
COPY --from=base /opt/exawind /opt/exawind

RUN (\
    echo "/opt/exawind/lib" > /etc/ld.so.conf.d/exawind.conf \
    && ldconfig \
    )

ENV PATH /opt/exawind/bin:${PATH}
