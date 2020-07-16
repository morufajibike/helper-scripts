#!/bin/sh

# On all three nodes, run the following:
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Install Flannel in the cluster by running this only on the Master node
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

## Apply Calico CNI network overlay (run only on the master) [Alternative to Flannel]
## For kubelet=1.17.8-00 kubeadm=1.17.8-00 kubectl=1.17.8-00
# kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml

# It is also a good idea to verify that the Flannel pods are up and running. Run this command to get a list of system pods:
kubectl get pods -n kube-system

# Verify that all the nodes now have a STATUS of Ready:
kubectl get nodes

