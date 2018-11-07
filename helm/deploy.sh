#!/bin/bash

ENVIRONMENT=${1:-ci}

helm repo update
helm upgrade --install ${APPNAME}-${ENVIRONMENT} fairspace/${APPNAME} --namespace=${APPNAME}-${ENVIRONMENT} --version $VERSION --timeout 600 -f ${DEPLOYMENT_CONFIG_DIR}/${ENVIRONMENT}-values.yaml
