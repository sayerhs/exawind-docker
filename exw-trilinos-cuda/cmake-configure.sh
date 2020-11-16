#!/bin/bash

if [ "${ENABLE_CUDA:-OFF}" = "ON" ] ; then
    export NVCC_WRAPPER_DEFAULT_COMPILER=$(which g++)
    export OMPI_CXX=$(which nvcc_wrapper)
fi

cmake_cmd=(
    cmake
    -DCMAKE_INSTALL_PREFIX=/opt/exawind
    -DBUILD_SHARED_LIBS:BOOL=OFF
    -DKOKKOS_ARCH_VOLTA70=${ENABLE_CUDA}
    -DMPI_USE_COMPILER_WRAPPERS:BOOL=ON
    -DTrilinos_ENABLE_OpenMP:BOOL=${ENABLE_OPENMP}
    -DKokkos_ENABLE_OPENMP:BOOL=${ENABLE_OPENMP}
    -DTpetra_INST_OPENMP:BOOL=${ENABLE_OPENMP}
    -DTrilinos_ENABLE_CUDA:BOOL=${ENABLE_CUDA}
    -DTPL_ENABLE_CUDA:BOOL=${ENABLE_CUDA}
    -DTPL_ENABLE_CUSPARSE:BOOL=OFF
    -DKokkos_ENABLE_CUDA:BOOL=${ENABLE_CUDA}
    -DKokkos_ENABLE_CUDA_UVM:BOOL=${ENABLE_CUDA}
    -DTpetra_ENABLE_CUDA:BOOL=${ENABLE_CUDA}
    -DTpetra_INST_CUDA:BOOL=${ENABLE_CUDA}
    -DKokkos_ENABLE_CUDA_LAMBDA:BOOL=${ENABLE_CUDA}
    -DKokkos_ENABLE_CUDA_RELOCATABLE_DEVICE_CODE:BOOL=${ENABLE_CUDA}
    -DKokkos_ENABLE_DEPRECATED_CODE:BOOL=OFF
    -DTpetra_INST_SERIAL:BOOL=ON
    -DTrilinos_ENABLE_CXX11:BOOL=ON
    -DTrilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON
    -DTpetra_INST_DOUBLE:BOOL=ON
    -DTpetra_INST_COMPLEX_DOUBLE:BOOL=OFF
    -DTrilinos_ENABLE_TESTS:BOOL=OFF
    -DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=OFF
    -DTrilinos_ASSERT_MISSING_PACKAGES:BOOL=OFF
    -DTrilinos_ALLOW_NO_PACKAGES:BOOL=OFF
    -DTrilinos_ENABLE_Epetra:BOOL=OFF
    -DTrilinos_ENABLE_Tpetra:BOOL=ON
    -DTrilinos_ENABLE_KokkosKernels:BOOL=ON
    -DTrilinos_ENABLE_ML:BOOL=OFF
    -DTrilinos_ENABLE_MueLu:BOOL=ON
    -DXpetra_ENABLE_Kokkos_Refactor:BOOL=ON
    -DMueLu_ENABLE_Kokkos_Refactor:BOOL=ON
    -DTrilinos_ENABLE_EpetraExt:BOOL=OFF
    -DTrilinos_ENABLE_AztecOO:BOOL=OFF
    -DTrilinos_ENABLE_Belos:BOOL=ON
    -DTrilinos_ENABLE_Ifpack2:BOOL=ON
    -DTrilinos_ENABLE_Amesos2:BOOL=ON
    -DAmesos2_ENABLE_SuperLU:BOOL=ON
    -DAmesos2_ENABLE_KLU2:BOOL=ON
    -DTrilinos_ENABLE_Zoltan2:BOOL=ON
    -DTrilinos_ENABLE_Ifpack:BOOL=OFF
    -DTrilinos_ENABLE_Amesos:BOOL=OFF
    -DTrilinos_ENABLE_Zoltan:BOOL=ON
    -DTrilinos_ENABLE_STK:BOOL=ON
    -DTrilinos_ENABLE_Gtest:BOOL=ON
    -DTrilinos_ENABLE_SEACASExodus:BOOL=ON
    -DTrilinos_ENABLE_SEACASIoss:BOOL=ON
    -DTPL_ENABLE_MPI:BOOL=ON
    -DTPL_ENABLE_Boost:BOOL=ON
    -DTPL_ENABLE_SuperLU:BOOL=ON
    -DSuperLU_INCLUDE_DIRS:PATH=/usr/include/superlu
    -DTPL_ENABLE_Netcdf:BOOL=ON
    -DTPL_Netcdf_PARALLEL:BOOL=ON
    -DTPL_ENABLE_Pnetcdf:BOOL=ON
    -DTPL_ENABLE_HDF5:BOOL=ON
    -DTPL_ENABLE_Zlib:BOOL=ON
    -DTPL_ENABLE_BLAS:BOOL=ON
    -G Ninja
    ..
)

eval "${cmake_cmd[@]}"
