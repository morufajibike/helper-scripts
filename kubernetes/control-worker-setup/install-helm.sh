#!/bin/bash

# Setup the Helm GPG key and package repository.
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# install helm
sudo apt-get update
sudo apt-get install -y helm

# verify helm version
helm version
