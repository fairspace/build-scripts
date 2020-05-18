#!/bin/bash
#
# Optional variables:
# - GRADLE_OPTIONS

# shellcheck disable=SC2086
./gradlew wrapper clean build test $GRADLE_OPTIONS
