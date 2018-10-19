#!/bin/bash
#
# This script will add a pod annotation to ensure
# that the pod will be recreated for new SNAPSHOT images
#
# Required env variables:
#   $APPNAME
#   $COMMIT_ID
#

# Add a pod annotation in the values.yaml file
echo "\npodAnnotations:\n  commit: $COMMIT_ID" >> charts/${APPNAME}/values.yaml
