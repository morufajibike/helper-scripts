#!/bin/bash

# script used to set up kubernetes master node

./scripts/configure-kubernetes.sh
./scripts/configure-networking.sh
./scripts/configure-master.sh
./scripts/install-cni-on-master.sh
./scripts/install-pkgs.sh
