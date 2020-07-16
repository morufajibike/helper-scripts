#!/bin/bash

## Building a Highly Available Kubernetes Cluster

# View the pods in the default namespace with a custom view:
kubectl get pods -o custom-columns=POD:metadata.name,NODE:spec.nodeName --sort-by spec.nodeName -n kube-system

# View the kube-scheduler YAML:
kubectl get endpoints kube-scheduler -n kube-system -o yaml

# Create a file called kubeadm-config.yaml
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
kubernetesVersion: stable
controlPlaneEndpoint: "LOAD_BALANCER_DNS:LOAD_BALANCER_PORT"
etcd:
  external:
    endpoints:
    - https://ETCD_0_IP:2379
    - https://ETCD_1_IP:2379
    - https://ETCD_2_IP:2379
    catFile: /etc/kubernetes/pki/etcd/ca.crt
    certFile: /etc/kubernetes/pki/apiserver-etcd-client.crt
    keyFile: /etc/kubernetes/pki/apiserver-etcd-client.key
    
# Create a stacked etcd topology using kubeadm:
kubeadm init --config=kubeadm-config.yaml

# Watch as pods are created in the default namespace:
kubectl get pods -n kube-system -w
