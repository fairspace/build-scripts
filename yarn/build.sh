#!/bin/bash

set -e

npm config set @fairspace:registry https://api.bintray.com/npm/thehyve/fairspace-npm
# The environment variables are set are due to the version of gcc
# needing to be at least 4.9 to properly install the
# jsonld dependency rdf-canonize.
env CC=/usr/bin/gcc-4.9 CXX=/usr/bin/g++-4.9 yarn install
CI=true DISPLAY=:99 yarn test:coverage --silent
yarn build
