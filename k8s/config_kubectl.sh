#!/bin/bash
#
# Required env variables for Azure:
#
# $KUBE_CONFIG_ENC_KEY
# $KUBE_CONFIG_ENC_IV
# $DEPLOYMENT_CONFIG_DIR
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
else  echo "Retrieving stored Kubernetes credentials for Azure ..."
      openssl aes-256-cbc -K "$KUBE_CONFIG_ENC_KEY" -iv "$KUBE_CONFIG_ENC_IV" -in "${DEPLOYMENT_CONFIG_DIR}/kube-config.yml.enc" -out "$HOME/.kube/config" -d
fi
