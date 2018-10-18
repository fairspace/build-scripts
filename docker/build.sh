#!/bin/bash
#
# Required env variables:
#   $CONTAINER_NAME
#
if [[ -z "$RELEASE_CONTAINER_NAME" ]]
then docker build . --tag "${CONTAINER_NAME}"
else docker build . --tag "${CONTAINER_NAME}" --tag "${RELEASE_CONTAINER_NAME}"
fi
