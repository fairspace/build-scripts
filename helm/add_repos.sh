#!/bin/bash

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/

if [ "$DEPLOY_PLATFORM" = "GCP" ]
then  echo "Adding GCP helm repository ..."
      # This is a workaround for not being able to provide a GCP service account
      # for the GCS plugin directly. See https://github.com/nouney/helm-gcs/issues/12
      export GOOGLE_APPLICATION_CREDENTIALS=/home/travis/ci-service-account.json
      helm repo add fairspace gs://fairspace-helm
fi

helm repo update
