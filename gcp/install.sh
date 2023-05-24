#!/bin/bash
#
sudo apt-get update && sudo apt-get install -y apt-transport-https
sudo snap remove google-cloud-cli
sudo snap install google-cloud-sdk --classic
