#!/bin/bash
#
# Optional variables:
# - GRADLE_OPTIONS

# shellcheck disable=SC2086
./gradlew clean build test $GRADLE_OPTIONS
