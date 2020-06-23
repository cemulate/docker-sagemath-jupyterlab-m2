#!/bin/bash

SAGE_VERSION="9.0"

SAGE_TAG="${SAGE_VERSION}-py3"

case "$1" in
    dev) BASE_IMAGE="cemulate/sagemath-jupyterlab-dev:${SAGE_TAG}"; IMAGE_POSTFIX="-dev" ;;
    *) BASE_IMAGE="cemulate/sagemath-jupyterlab:${SAGE_TAG}"; IMAGE_POSTFIX="" ;;
esac

TARGET="cemulate/sagemath-jupyterlab-m2${IMAGE_POSTFIX}:${SAGE_TAG}"

docker build -t $TARGET --build-arg BASE_IMAGE=$BASE_IMAGE .