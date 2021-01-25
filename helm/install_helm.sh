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
helm init --client-only --stable-repo-url https://charts.helm.sh/stable

if [ "$DEPLOY_PLATFORM" = "GCP" ]
then  echo "Installing Helm GCS plugin ..."
      helm plugin install https://github.com/hayorov/helm-gcs.git
fi
