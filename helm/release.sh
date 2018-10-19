#!/bin/bash
#
# Required env variables:
#   $APPNAME
#   $VERSION
#
#   $GITHUB_USERNAME
#   $GITHUB_PASSWORD
#

# Package chart
helm package charts/${APPNAME}

# Get Chart version number
CHARTVERSION=$(sed -n 's/^version: //p' charts/${APPNAME}/Chart.yaml)
echo Chart version number is $CHARTVERSION

# Add chart to helm repo
az acr helm push ${APPNAME}-${CHARTVERSION}.tgz -n fairspace

# Cleanup
rm -rf $APPNAME*.tgz

