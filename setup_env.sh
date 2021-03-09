#!/bin/bash

# Generic properties
export HELM_VERSION="2.14.3"
export KUBECTL_VERSION="1.12.0"

# Platform-specific settings
export DOCKER_REPO=eu.gcr.io
export ORG=fairspace-207108

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

CURRENTVERSION="$(cat VERSION)"
export CURRENTVERSION

export VERSION="${CURRENTVERSION}${VERSION_POSTFIX}"

NEWVERSION="$(./ci/versioning/nextversion.sh "${CURRENTVERSION}")"
export NEWVERSION

# Set container name
export CONTAINER_NAME="${DOCKER_REPO}/${ORG}/${APPNAME}:${VERSION}"

# Set the commit id to either the actual commit hash or to the tag for actual releases
if [[ "$TRAVIS_BRANCH" = "$SNAPSHOT_BRANCH" ]]; then
    COMMIT_ID=$(git log --pretty=format:'%h' -n 1)
    export COMMIT_ID
else
    export COMMIT_ID="v${CURRENTVERSION}"
fi;
