#!/bin/bash
#
# Required env variables:
#   $APPNAME
#   $VERSION
#   $ARTIFACT_BUILD_FILE
#
#   $GITHUB_USERNAME
#   $GITHUB_PASSWORD
#
# Optional: $GIT_TAG_FILES_OVERRIDE
#

# Commit the updated values and put a git tag

if [ -z "$GIT_TAG_FILES_OVERRIDE" ]
then GIT_TAG_FILES="./charts/${APPNAME}/Chart.yaml ./charts/${APPNAME}/values.yaml ${ARTIFACT_BUILD_FILE}"
else GIT_TAG_FILES="$GIT_TAG_FILES_OVERRIDE"
fi

if [ ! -z "$GIT_TAG_FILES" ]
then git add $GIT_TAG_FILES
fi

git commit -m "Release version $VERSION [skip ci]" --allow-empty # if first release then no version update is performed
git tag -fa v$VERSION -m "Release version $VERSION"
git remote add origin-authenticated $(git remote get-url origin | sed s/github.com/$GITHUB_USERNAME:$GITHUB_PASSWORD@github.com/i) || {
  echo "Adding remote origin-authenticated failed or it already exists."
}
git push origin-authenticated v$VERSION
