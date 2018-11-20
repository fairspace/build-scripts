#!/bin/bash

ENVIRONMENT=${1:-ci}

helm repo update
helm upgrade --install ${APPNAME}-${ENVIRONMENT} fairspace/${APPNAME} --namespace=${APPNAME}-${ENVIRONMENT} --version $VERSION -f ${DEPLOYMENT_CONFIG_DIR}/${ENVIRONMENT}-values.yaml --timeout 1500
