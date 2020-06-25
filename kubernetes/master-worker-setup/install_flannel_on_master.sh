#!/bin/sh

# Install Flannel in the cluster by running this only on the Master node
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

# It is also a good idea to verify that the Flannel pods are up and running. Run this command to get a list of system pods:
kubectl get pods -n kube-system

# Verify that all the nodes now have a STATUS of Ready:
kubectl get nodes