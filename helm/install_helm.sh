#!/bin/bash
#
# Required env variables:
#   $HELM_VERSION

mkdir -p "$HOME/downloads"
wget --no-clobber "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" -O "$HOME/downloads/helm-v${HELM_VERSION}.tar.gz"
tar xvfz "$HOME/downloads/helm-v${HELM_VERSION}.tar.gz" --directory "$HOME"

export PATH="$HOME/linux-amd64/:$PATH"
helm repo add stable https://charts.helm.sh/stable

echo "Installing Helm GCS plugin ..."
helm plugin install https://github.com/hayorov/helm-gcs.git --version 0.3.11
