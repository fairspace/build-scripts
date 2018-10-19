#!/bin/bash

export CURRENTVERSION="$(cat VERSION)"

if [[ "$TRAVIS_BRANCH" = "$SNAPSHOT_BRANCH" ]]; then
    # Set the commit id to either the actual commit hash or to the tag for actual releases
    export COMMIT_ID=$(git log --pretty=format:'%h' -n 1)
    export VERSION_POSTFIX="-SNAPSHOT-${COMMIT_ID}"
else
    export COMMIT_ID="v${CURRENTVERSION}"
fi

if [[ "$TRAVIS_BRANCH" = "$SNAPSHOT_BRANCH" ]] && [[ "$TRAVIS_PULL_REQUEST" = "false" ]]; then
    export SHOULD_RELEASE=1
fi

if [[ "$TRAVIS_BRANCH" = "$RELEASE_BRANCH" ]] && [[ "$TRAVIS_PULL_REQUEST" = "false" ]]; then
    export COMMIT_ID="v${CURRENTVERSION}"
    export SHOULD_RELEASE=1
fi

export VERSION="${CURRENTVERSION}${VERSION_POSTFIX}"
export CONTAINER_NAME="${DOCKER_REPO}/${ORG}/${APPNAME}:${VERSION}"
export NEWVERSION="$(./ci/versioning/nextversion.sh ${CURRENTVERSION})"

