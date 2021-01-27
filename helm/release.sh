#!/bin/bash
#
# Required env variables:
#   $APPNAME
#   $VERSION

# Package chart
helm package "charts/${APPNAME}"

# Add chart to helm repo. Azure and GCP/GCS allow two options: --force for updating
# and no option for adding.
# For that reason, check whether the chart exists first for SNAPSHOT versions
# non-snapshot versions should never be overwritten
if [[ $VERSION == *SNAPSHOT ]]; then

    helm fetch -d /tmp "fairspace/$APPNAME" --version "$VERSION" >& /dev/null

    # If the exit status is not 0, the chart does not exist yet
    # If the exit status is 0, the chart does exist already
    rc=$?
    if [[ $rc == 0 ]]; then
        echo "Chart version $VERSION already exists. Overwriting it"
        DEPLOY_OPTIONS="--force"
    fi
fi

echo "Pushing package to GCS repository ..."
helm gcs push "${APPNAME}-${VERSION}.tgz" fairspace-gcs --public $DEPLOY_OPTIONS

# Cleanup
rm -rf "$APPNAME*.tgz"
