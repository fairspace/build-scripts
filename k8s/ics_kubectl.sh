#!/bin/sh

# This script is just a shorthand for Installing, Configuring and Switching context
# of kubectl.

echo "Installing kubectl ..."
"$BUILD_SCRIPTS_DIR/k8s/install_kubectl.sh"
export PATH="$HOME/downloads/v${KUBECTL_VERSION}:$PATH"

echo "Configuring kubectl ..."
"$BUILD_SCRIPTS_DIR/k8s/config_kubectl.sh"
"$BUILD_SCRIPTS_DIR/k8s/switch_context.sh"
