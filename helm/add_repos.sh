#!/bin/bash

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo add elastic https://helm.elastic.co
helm repo add codecentric https://codecentric.github.io/helm-charts

if [[ "$NEED_INTERNAL_HELM" ]]
then
    echo "Adding public fairspace repository ..."
    helm repo add fairspace https://storage.googleapis.com/fairspace-helm
    echo "Adding writable helm repository on Google Storage ..."
    # This is a workaround for not being able to provide a GCP service account
    # for the GCS plugin directly. See https://github.com/nouney/helm-gcs/issues/12
    export GOOGLE_APPLICATION_CREDENTIALS=/home/travis/ci-service-account.json
    helm repo add fairspace-gcs gs://fairspace-helm
fi

helm repo update
