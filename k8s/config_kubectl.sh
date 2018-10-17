#!/bin/bash
#
# Required env variables:
#
# $KUBE_CONFIG_ENC_KEY
# $KUBE_CONFIG_ENC_IV
# $DEPLOYMENT_CONFIG_DIR
#
# The specific kube-config file is stored encrypted
#
mkdir -p $HOME/.kube
openssl aes-256-cbc -K $KUBE_CONFIG_ENC_KEY -iv $KUBE_CONFIG_ENC_IV -in ${DEPLOYMENT_CONFIG_DIR}/kube-config.yml.enc -out $HOME/.kube/config -d
