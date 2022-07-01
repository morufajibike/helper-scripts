# On the control plane node only, initialize the cluster and set up kubectl access.
sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.23.0

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get nodes

# Install the Calico network add-on

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# get the join command
kubeadm token create --print-join-command

echo "IMPORTANT STEP!!!"
echo "Copy the join command from the control plane node and run it with 'sudo' on each worker node."
echo "Run kubectl get nodes when the worker nodes have joined the control node"
