#!/bin/bash
#
# Required env variables:
#   $ARTIFACT_BUILD_FILE
#   $VERSION

# Update version number in build.gradle
#
sed -i -e "s/version = 'RELEASEVERSION'/version = '$VERSION'/" $ARTIFACT_BUILD_FILE
