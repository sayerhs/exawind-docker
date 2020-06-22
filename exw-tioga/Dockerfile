FROM exawind/exw-dev-deps as base

RUN (\
    git clone --depth 1 https://github.com/jsitaraman/tioga.git \
    && cd tioga \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/opt/exawind .. \
    && make -j$(nproc) \
    && make install \
    && cd ../.. \
    && rm -rf tioga \
    && cd /opt/exawind/lib \
    && ls libtioga*so* | xargs strip -s \
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
