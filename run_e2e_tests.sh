#!/bin/bash
#
# Required env variables:
#   $GITHUB_USERNAME
#   $GITHUB_PASSWORD
#

E2E_TEST_REPO=fairspace/janus

# Fetch e2e tests
git clone https://$GITHUB_USERNAME:$GITHUB_PASSWORD@github.com/$E2E_TEST_REPO e2e-tests
cd e2e-tests

# Install and run
npm install cypress
node_modules/.bin/cypress run

result=$?


# Cleanup
rm -rf e2e-tests

exit $result
