#!/bin/bash

ENVIRONMENT=${1:-ci}

helm upgrade --install ${APPNAME}-${ENVIRONMENT} fairspace/${APPNAME} --namespace=${APPNAME}-${ENVIRONMENT} --version $VERSION -f ${DEPLOYMENT_CONFIG_DIR}/${ENVIRONMENT}-values.yaml
