#!/bin/bash

ENVIRONMENT=${1:-ci}

helm delete --purge ${APPNAME}-${ENVIRONMENT}
