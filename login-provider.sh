#!/bin/sh

if [ "$DEPLOY_PLATFORM" = "GCP" ]
then echo "Installing Google Cloud SDK ..."
     "$BUILD_SCRIPTS_DIR/gcp/install.sh"
     echo "Configuring Google Cloud SDK ..."
     "$BUILD_SCRIPTS_DIR/gcp/login.sh"
fi
