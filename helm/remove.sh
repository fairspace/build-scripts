#!/bin/bash

ENVIRONMENT=${1:-ci}

helm uninstall "${APPNAME}-${ENVIRONMENT}"
