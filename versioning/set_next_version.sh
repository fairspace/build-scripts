#!/bin/bash
#
# Required env variables:
#   $APPNAME
#   $NEWVERSION
#
#   $GITHUB_USERNAME
#   $GITHUB_PASSWORD
#

# Go back to the branch itself
git stash --all
git checkout $TRAVIS_BRANCH

# Have git fetch the other branches as well.
# See https://github.com/travis-ci/travis-ci/issues/4806#issuecomment-351808322
git config remote.origin.fetch refs/heads/*:refs/remotes/origin/*

# Ensure the latest code is on the snapshot branch as well
git fetch
git checkout $SNAPSHOT_BRANCH || exit 1
git pull
git merge $TRAVIS_BRANCH --no-edit

# Set new version
echo $NEWVERSION > VERSION
git add VERSION
git commit -m "Prepare for next development cycle for version $NEWVERSION [full build]"
git remote add origin-authenticated $(git remote get-url origin | sed s/github.com/$GITHUB_USERNAME:$GITHUB_PASSWORD@github.com/i)
git push origin-authenticated HEAD
