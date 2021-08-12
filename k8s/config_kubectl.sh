#!/bin/bash
#
# Required env variables for GCP:
# $CLUSTER_NAME
# $CLUSTER_ZONE
#
# The specific kube-config file is stored encrypted
#
mkdir -p "$HOME/.kube"
if [ "$DEPLOY_PLATFORM" = "GCP" ]
then  echo "Retrieving Kubernetes credentials via gcloud ..."
      gcloud container clusters get-credentials "$CLUSTER_NAME" --zone "$CLUSTER_ZONE"
fi
