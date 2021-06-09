#!/bin/bash
#
# Required env variables:
#   $CONTAINER_NAME
#   $DOCKER_REPO
#   $DOCKER_USERNAME
#   $DOCKER_PASSWORD
#
"${BUILD_SCRIPTS_DIR}/docker/login.sh"

if [[ -z "$RELEASE_CONTAINER_NAME" ]]
then docker build . --tag "${CONTAINER_NAME}"
else docker build . --tag "${CONTAINER_NAME}" --tag "${RELEASE_CONTAINER_NAME}"
fi
