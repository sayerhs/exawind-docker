#!/bin/bash

set -e
set -o pipefail

__EXW_DKR_UTILS_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
__EXW_DKR_DIR=$(dirname ${__EXW_DKR_UTILS_DIR})
EXW_ORG=${EXW_ORG:-exawind}

update_latest_tag ()
{
    echo "==> Fetching and updating latest tags"
    local reg_url="https://registry.hub.docker.com/v1/repositories"
    local repos=(
        exw-trilinos
        exw-openfast
        nalu-wind
    )

    for rname in "${repos[@]}" ; do
        echo "==> Updating ${EXW_ORG}/${rname}"
        rtag=$(curl -s ${reg_url}/${EXW_ORG}/${rname}/tags | jq ".[].name" | grep -v "latest" | sort | tail -1 | sed -e 's/"//g')
        docker pull ${EXW_ORG}/${rname}:${rtag}
        docker image tag ${EXW_ORG}/${rname}:${rtag} ${EXW_ORG}/${rname}:latest
        docker push ${EXW_ORG}/${rname}:latest
    done
}

build_new_images ()
{
    echo "==> Building new images"
    local repos=(
        wind-utils
        amr-wind
        exawind
        exawind-dev
    )

    for rname in "${repos[@]}" ; do
        echo "==> Building ${EXW_ORG}/${rname}"
        cd ${__EXW_DKR_DIR}/${rname}
        DOCKER_BUILDKIT=1 docker build -t "${EXW_ORG}/${rname}" .
        docker push ${EXW_ORG}/${rname}:latest
    done
}

update_latest_tag
build_new_images
