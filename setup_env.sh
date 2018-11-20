#!/bin/bash

# Generic properties
export DOCKER_REPO=fairspace.azurecr.io
export ORG=fairspace
export CHART_REPO="https://fairspace.azurecr.io/helm/v1/repo"
export HELM_VERSION="2.11.0"
export KUBECTL_VERSION="1.12.0"

# Determine whether or not we should perform a release
if [[ "$TRAVIS_BRANCH" = "$SNAPSHOT_BRANCH" ]] && [[ "$TRAVIS_PULL_REQUEST" = "false" ]]; then
    export SHOULD_RELEASE=1
fi

if [[ "$TRAVIS_BRANCH" = "$RELEASE_BRANCH" ]] && [[ "$TRAVIS_PULL_REQUEST" = "false" ]]; then
    export SHOULD_RELEASE=1
fi

# Determine current and new versions
if [[ "$TRAVIS_BRANCH" = "$SNAPSHOT_BRANCH" ]]; then
    export VERSION_POSTFIX="-SNAPSHOT"
fi

export CURRENTVERSION="$(cat VERSION)"
export VERSION="${CURRENTVERSION}${VERSION_POSTFIX}"
export NEWVERSION="$(./ci/versioning/nextversion.sh ${CURRENTVERSION})"

# Set container name
export CONTAINER_NAME="${DOCKER_REPO}/${ORG}/${APPNAME}:${VERSION}"

# Set the commit id to either the actual commit hash or to the tag for actual releases
if [[ "$TRAVIS_BRANCH" = "$SNAPSHOT_BRANCH" ]]; then
    export COMMIT_ID=$(git log --pretty=format:'%h' -n 1)
else
    export COMMIT_ID="v${CURRENTVERSION}"
fi;
