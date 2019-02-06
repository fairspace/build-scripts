#!/bin/bash
#
gcloud config set project "${GCP_PROJECT}"

openssl aes-256-cbc -K "$KUBE_CONFIG_ENC_KEY" -iv "$KUBE_CONFIG_ENC_IV" -in "${DEPLOYMENT_CONFIG_DIR}/ci-service-account.json.enc" -out "$HOME/ci-service-account.json" -d
gcloud auth activate-service-account "--key-file=$HOME/ci-service-account.json"

# This is a workaround for not being able to provide a GCP service account
# for the GCS plugin directly. See https://github.com/nouney/helm-gcs/issues/12
export GOOGLE_APPLICATION_CREDENTIALS=/home/travis/ci-service-account.json

helm repo add fairspace gs://fairspace-helm
