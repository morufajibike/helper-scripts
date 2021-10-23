#!/bin/sh

# On the Kube master node, initialize the cluster
# with cidr used by flannel by default
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

#  set up the local kubeconfig
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Verify that the cluster is responsive and that Kubectl is working:
kubectl version

# The kubeadm init command should output a kubeadm join command containing a token and hash. 
# Copy that command and run it with sudo on both worker nodes. It should look something like this:

# sudo kubeadm join $some_ip:6443 --token $some_token --discovery-token-ca-cert-hash $some_hash

# Verify that all nodes have successfully joined the cluster

kubectl get nodes
