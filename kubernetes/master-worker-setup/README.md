
### Set up
Run these scripts in the following order for kubernetes master - worker nodes setup

#### On master node, execute:
- `./setup-master.sh`
#### On worker node(s), execute on each of them:
- `./setup-workers.sh`

#### Join worker nodes to master:
- Copy kubeadm join command from master node. It gets printed on the terminal after a successful execution of the script above.
- Execute on each of the worker nodes for them to join the master.
- Remember to add sudo.

### End to end test

#### kubetest => https://github.com/kubernetes/community/blob/master/contributors/devel/sig-testing/e2e-tests.md

#### Kubernetes Cheat Sheet
```
#### run a simple nginx deployment
kubectl run nginx --image=nginx

#### view the current deployments
kubectl get deployments

#### list the pods in the cluster
kubectl get pods

#### forward port 80 to 8081 on pod
kubectl port-forward <pod_name> 8081:80

#### get a response from the nginx pod
curl --head http://127.0.0.1:8081

#### get the pod's logs
kubectl logs <pod_name>

#### run a command on the pod nginx
kubectl exec -it <pod_name> -- nginx -v

#### create a service using our deployment
kubectl expose deployment nginx --port 80 --type NodePort

#### list the services in the cluster
kubectl get services

#### get a response from the service
curl -I localhost:<node port>

#### list node status
kubectl get nodes

#### get detailed info about nodes
kubectl describe nodes

#### get detailed info about pods
kubectl describe pods

### Add a new node
kubeadm token generate => <token_name>
kubeadm token create <token_name> --ttl 23h --print-join-command
- copy join command and execute in node
```
