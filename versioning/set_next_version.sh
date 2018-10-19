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
git pull

# Ensure the latest code is on the snapshot branch as well
git checkout $SNAPSHOT_BRANCH
git pull
git merge $TRAVIS_BRANCH --no-edit  

# Set new version
echo $NEWVERSION > VERSION
git add VERSION
git commit -m "Prepare for next development cycle for version $NEWVERSION [skip ci]"
git remote add origin-authenticated $(git remote get-url origin | sed s/github.com/$GITHUB_USERNAME:$GITHUB_PASSWORD@github.com/i)
git push origin-authenticated HEAD


