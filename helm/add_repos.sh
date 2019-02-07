#!/bin/bash

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/

if [ "$DEPLOY_PLATFORM" = "GCP" ]
then  echo "Adding GCP helm repository ..."
      helm repo add fairspace gs://fairspace-helm
fi

helm repo update
