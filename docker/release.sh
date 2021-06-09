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
then echo "Logging in on GCP Docker repository using oauth2 token ..."
     gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin "https://$DOCKER_REPO"
else echo "Logging in on Docker repository. "
     "${BUILD_SCRIPTS_DIR}/docker/login.sh"
fi

docker push "${CONTAINER_NAME}"
