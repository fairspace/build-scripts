#!/bin/sh

if [ "$INFRASTRUCTURE_PLATFORM" = "GCP" ]
then echo "Installing Google Cloud SDK ..."
     "$BUILD_SCRIPTS_DIR/gcp/install.sh"
     echo "Configuring Google Cloud SDK ..."
     "$BUILD_SCRIPTS_DIR/gcp/login.sh"
else echo "Installing Azure CLI ..."
     "$BUILD_SCRIPTS_DIR/az/install.sh"
     echo "Configuring Azure CLI ..."
     "$BUILD_SCRIPTS_DIR/az/login.sh"
fi
