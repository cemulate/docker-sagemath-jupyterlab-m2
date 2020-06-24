#!/bin/bash

SAGE_VERSION="9.1"

case "$1" in
    dev) BUILD_DEVELOPMENT="1"; SAGE_IMAGE="sagemath-dev"; SAGE_TAG="develop-py3"; IMAGE_POSTFIX="-dev" ;;
    *) BUILD_DEVELOPMENT=""; SAGE_IMAGE="sagemath"; SAGE_TAG="${SAGE_VERSION}-py3"; IMAGE_POSTFIX="" ;;
esac

TARGET="cemulate/sagemath-jupyterlab${IMAGE_POSTFIX}:${SAGE_TAG}"

echo $SAGE_TAG
echo $TARGET
echo "${SAGE_IMAGE}:${SAGE_TAG}"

docker build -t $TARGET --build-arg SAGE_IMAGE="${SAGE_IMAGE}:${SAGE_TAG}" --build-arg BUILD_DEVELOPMENT=$BUILD_DEVELOPMENT .
