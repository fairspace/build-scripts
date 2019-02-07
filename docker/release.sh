#!/bin/bash
#
# Required env variables:
#   $CONTAINER_NAME
#
#   $DOCKER_REPO
#   $DOCKER_USERNAME
#   $DOCKER_PASSWORD
#
if [ "$DEPLOY_PLATFORM" = "GCP" ]
then echo "Skipping Docker login step in docker/release, because we are on GCP and should be able to use the gcloud credential helper."
else echo "Logging in on Docker repository. "
     echo "${DOCKER_PASSWORD}" | docker login "${DOCKER_REPO}" -u "${DOCKER_USERNAME}" --password-stdin
fi

docker push "${CONTAINER_NAME}"
