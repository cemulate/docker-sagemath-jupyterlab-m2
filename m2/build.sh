#!/bin/bash

SAGE_VERSION="9.1"

case "$1" in
    dev) SAGE_TAG="develop-py3"; BASE_IMAGE="cemulate/sagemath-jupyterlab-dev:develop-py3"; IMAGE_POSTFIX="-dev" ;;
    *) SAGE_TAG="${SAGE_VERSION}-py3" BASE_IMAGE="cemulate/sagemath-jupyterlab:${SAGE_TAG}"; IMAGE_POSTFIX="" ;;
esac

TARGET="cemulate/sagemath-jupyterlab-m2${IMAGE_POSTFIX}:${SAGE_TAG}"

docker build -t $TARGET --build-arg BASE_IMAGE=$BASE_IMAGE .