#!/bin/bash
#
# Required env variables:
#   $HELM_VERSION

set -e
set -u

DOWNLOADDIR="$HOME/downloads"
DOWNLOADFILE="$DOWNLOADDIR/helm-v${HELM_VERSION}.tar.gz"

mkdir -p "$DOWNLOADDIR"

if [ ! -f "$DOWNLOADFILE" ]
then wget --no-clobber "https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz" -O "$DOWNLOADFILE"
fi

tar xvfz "$DOWNLOADFILE"

export PATH="$(pwd)/linux-amd64/:$PATH"
helm init --client-only
