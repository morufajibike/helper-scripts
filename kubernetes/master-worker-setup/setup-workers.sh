#!/bin/bash

# wait for master node setup to be completed
# run script on each of the worker nodes

./scripts/configure-kubernetes.sh
./scripts/configure-networking.sh

# Copy kubeadm join command on master node
# Execute command on each of the nodes for them to join the master
# Remember to add sudo for elevated privileges
