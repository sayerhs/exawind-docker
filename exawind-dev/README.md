# Quick reference

- **Maintained by:** [ExaWind team](https://github.com/exawind)
- **Where to file issues:** [GitHub issues page](https://github.com/sayerhs/exawind-docker/blob/master/exawind/Dockerfile)

# Supported tags and respective `Dockerfile` links

- [latest](https://github.com/sayerhs/exawind-docker/blob/master/exawind-dev/Dockerfile)


# What is ExaWind?

[ExaWind](https://exawind.org) is a suite of high-fidelity modeling codes for
wind-farm simulations. 

# How to use this image?

This image provides the complete development environment necessary to build
ExaWind codes from within a docker environment. If you are interested only in
using the executables, then look into
[exawind/exawind](https://hub.docker.com/repository/docker/exawind/exawind) as
it is a smaller image without the development libraries.

```console
# Run AMR-wind unit tests
docker run --rm exawind/exawind-dev amr_wind_unit_tests

# Run Nalu-Wind unit tests
docker run --rm exawind/exawind-dev unittestX --gtest_filter="-Actuator*Fast*.*"
```

Running the executables requires accessing files on the disk. Assuming you are
in a working directory with all the files required to run an executable, the
following examples show how to *mount* the working directory and run the executable.

```console
# Example using ncdump to inspect the files
docker run --rm -v $(pwd):/workspace exawind/exawind-dev ncdump -v eb_names,ss_names abl_mesh.exo

# Example running epu to combine files
docker run --rm -v $(pwd):/workspace exawind/exawind-dev epu -auto abl.e.4.0

# Running nalu executable
docker run --rm -v $(pwd):/workspace exawind/exawind-dev naluX -i airfoil.yaml 

# Running amr-wind executable
docker run --rm -v $(pwd):/workspace exawind/exawind-dev amr_wind inputs.abl time.max_step=5

# Running OpenFAST executable
docker run --rm -v $(pwd):/workspace exawind/exawind-dev openfast nrel5mw.fst
```

Few things to note:

- The docker image can access only files within the *mounted* directory and its
  subdirectories. If you have relative paths that refer to parent directories of
  the mounted directory, that won't work.
  
- Similarly symbolic links to paths outside of the mounted path will also not work.

# License

Please consult the individual codes for the license information.
