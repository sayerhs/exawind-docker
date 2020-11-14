FROM exawind/exw-dev-deps as base

ARG CUDA_VERSION_STRING="11-1"
ARG CUDA_VERSION="11.1"
RUN (\
    export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && wget -q -O - https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/7fa2af80.pub | apt-key add - \
    && echo "deb https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64 /" | tee /etc/apt/sources.list.d/cuda.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       cuda-command-line-tools-${CUDA_VERSION_STRING} \
       cuda-compiler-${CUDA_VERSION_STRING} \
       cuda-minimal-build-${CUDA_VERSION_STRING} \
       cuda-nvml-dev-${CUDA_VERSION_STRING} \
       cuda-nvtx-${CUDA_VERSION_STRING} \
       cuda-libraries-dev-${CUDA_VERSION_STRING} \
    && rm -rf /var/lib/apt/lists/* \
    )

COPY ./nvcc_wrapper /usr/local/bin

ENV PATH=/usr/local/cuda-${CUDA_VERSION}/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VERSION}/lib64:${LD_LIBRARY_PATH}
