FROM exawind/exw-dev-deps:latest

RUN (\
    apt-get update \
    && apt-get install -y --no-install-recommends gnupg2 \
    && update-ca-certificates \
    && wget --no-check-certificate https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB \
    && apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB \
    && echo "deb [trusted=yes] https://apt.repos.intel.com/oneapi all main" > /etc/apt/sources.list.d/OneAPI.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
            intel-oneapi-dpcpp-compiler intel-oneapi-mkl \
    && rm -rf /var/lib/apt/lists/* \
    )
