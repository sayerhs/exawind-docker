FROM exawind/exw-dev-cuda as base

ARG ENABLE_OPENMP=OFF
ARG ENABLE_CUDA=ON
COPY cmake-configure.sh /cmake-configure.sh
RUN (\
    git clone --depth 1 -b develop https://github.com/trilinos/trilinos.git \
    && cd trilinos \
    && mkdir build \
    && cd build \
    && /cmake-configure.sh \
    && export NVCC_WRAPPER_DEFAULT_COMPILER=$(which g++) \
    && export OMPI_CXX=$(which nvcc_wrapper) \
    && ninja -j$(nproc) \
    && ninja install \
    && cd ../.. \
    && rm -rf trilinos \
    && cd /opt/exawind/lib \
    && echo "/opt/exawind/lib" > /etc/ld.so.conf.d/exawind.conf \
    && ldconfig \
    )
