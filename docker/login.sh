#!/bin/bash
#
# Required env variables:
#   $DOCKER_REPO
#   $DOCKER_USERNAME
#   $DOCKER_PASSWORD
#
echo "${DOCKER_PASSWORD}" | docker login "${DOCKER_REPO}" -u "${DOCKER_USERNAME}" --password-stdin
