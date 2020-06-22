FROM exawind/exw-osdev as base

ARG CMAKE_VERSION=3.17.3
RUN (\
    wget -q https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz \
    && tar -xzf cmake-${CMAKE_VERSION}.tar.gz \
    && cd cmake-${CMAKE_VERSION} \
    && ./bootstrap \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf cmake-${CMAKE_VERSION} \
    && rm cmake-${CMAKE_VERSION}.tar.gz \
    )

ARG NINJA_VERSION=1.10.0
RUN (\
    wget -q -O ninja-${NINJA_VERSION}.tar.gz https://github.com/ninja-build/ninja/archive/v${NINJA_VERSION}.tar.gz \
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

ARG HDF5_VERSION=1.10.4
RUN (\
    wget -q --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-${HDF5_VERSION}/src/hdf5-${HDF5_VERSION}.tar.gz \
    && tar -xzf hdf5-${HDF5_VERSION}.tar.gz \
    && cd hdf5-${HDF5_VERSION} \
    && ./configure CC=mpicc CXX=mpicxx FC=mpifort CFLAGS='-fPIC' CXXFLAGS='-fPIC' FCFLAGS='-fPIC' --prefix=/usr/local --disable-threadsafe --enable-cxx --enable-hl --disable-fortran --without-szlib --enable-parallel --disable-static --enable-shared --disable-tests --enable-unsupported \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf hdf5-${HDF5_VERSION} \
    && rm hdf5-${HDF5_VERSION}.tar.gz \
    && ldconfig \
    )

ARG PNETCDF_VERSION=1.11.2
RUN (\
    wget -q --no-check-certificate https://parallel-netcdf.github.io/Release/pnetcdf-${PNETCDF_VERSION}.tar.gz \
    && tar -xzf pnetcdf-${PNETCDF_VERSION}.tar.gz \
    && cd pnetcdf-${PNETCDF_VERSION} \
    && ./configure CC=mpicc CXX=mpicxx FC=mpifort CFLAGS='-fPIC' CXXFLAGS='-fPIC' FFLAGS=-fPIC --prefix=/usr/local --disable-fortran  --enable-shared --disable-static --enable-relax-coord-bound \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf pnetcdf-${PNETCDF_VERSION} \
    && rm pnetcdf-${PNETCDF_VERSION}.tar.gz \
    && ldconfig \
    )

ARG NETCDF_VERSION=4.7.1
RUN (\
    wget -q https://www.gfd-dennou.org/arch/netcdf/unidata-mirror/netcdf-c-${NETCDF_VERSION}.tar.gz \
    && tar -xzf netcdf-c-${NETCDF_VERSION}.tar.gz \
    && cd netcdf-c-${NETCDF_VERSION} \
    && ./configure CC=mpicc CXX=mpicxx FC=mpifort CFLAGS='-fPIC' --prefix=/usr/local --disable-fsync --disable-cdmremote --disable-dap --enable-shared --disable-static --disable-doxygen --disable-v2 --enable-pnetcdf \
    && make -j$(nproc) \
    && make install \
    && cd .. \
    && rm -rf netcdf-c-${NETCDF_VERSION} \
    && rm netcdf-c-${NETCDF_VERSION}.tar.gz \
    && ldconfig \
    )

ARG HYPRE_VERSION=2.18.2
RUN (\
    wget -q -O hypre-${HYPRE_VERSION}.tar.gz https://github.com/hypre-space/hypre/archive/v${HYPRE_VERSION}.tar.gz \
    && tar -xzf hypre-${HYPRE_VERSION}.tar.gz \
    && cd hypre-${HYPRE_VERSION}/src \
    && ./configure --prefix=/usr/local --without-superlu --enable-bigint --without-openmp --without-cuda --enable-shared \
    && make -j$(nproc) \
    && make install \
    && cd ../.. \
    && rm -rf hypre-${HYPRE_VERSION} \
    && rm hypre-${HYPRE_VERSION}.tar.gz \
    )

