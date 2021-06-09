#!/bin/bash

ENVIRONMENT=${1:-ci}
EXTRA_ARGS=${@:2}

# This is a workaround for not being able to provide a GCP service account
# for the GCS plugin directly. See https://github.com/nouney/helm-gcs/issues/12
export GOOGLE_APPLICATION_CREDENTIALS=/home/travis/ci-service-account.json

helm repo update
echo "Fetching version $VERSION"
helm upgrade --install "${APPNAME}-${ENVIRONMENT}" "fairspace/${APPNAME}" --namespace "${APPNAME}-${ENVIRONMENT}" --version "$VERSION" -f "${DEPLOYMENT_CONFIG_DIR}/${ENVIRONMENT}-values.yaml" --timeout "1500s" $EXTRA_ARGS
