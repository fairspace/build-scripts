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

# Add chart to helm repo. Azure allows two options: --force for updating
# and no option for adding.
# For that reason, check whether the chart exists first for SNAPSHOT versions
# non-snapshot versions should never be overwritten
if [[ $VERSION == *SNAPSHOT ]]; then
    az acr helm show $APPNAME --version $VERSION -n fairspace > /dev/null 2>&1

    # If the exit status is not 0, the chart does not exist yet
    # If the exit status is 0, the chart does exist already
    rc=$?
    if [[ $rc == 0 ]]; then
        echo "Chart version $VERSION already exists. Overwriting it"
        DEPLOY_OPTIONS="--force"
    fi
fi

az acr helm push ${APPNAME}-${VERSION}.tgz -n fairspace $DEPLOY_OPTIONS > /dev/null

# Cleanup
rm -rf $APPNAME*.tgz

