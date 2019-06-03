#!/bin/bash
#
# Required env variables:
#   $HELM_VERSION
#
# Optional env variables:
#   $DEPLOY_PLATFORM

mkdir -p "$HOME/downloads"
wget --no-clobber "https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz" -O "$HOME/downloads/helm-v${HELM_VERSION}.tar.gz"
tar xvfz "$HOME/downloads/helm-v${HELM_VERSION}.tar.gz" --directory "$HOME"

export PATH="$HOME/linux-amd64/:$PATH"
helm init --client-only

if [ "$DEPLOY_PLATFORM" = "GCP" ]
then  echo "Installing Helm GCS plugin ..."
      # There is a breaking change in v0.2.1 of this plugin
      # See https://github.com/hayorov/helm-gcs/issues/20
      helm plugin install https://github.com/nouney/helm-gcs --version 0.2.0
fi
