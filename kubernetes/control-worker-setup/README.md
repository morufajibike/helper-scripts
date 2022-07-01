## Overview

## Prerequisites
- The configuration scripts here have been used with `Ubuntu 20.04 Focal Fossa LTS` only.
- Set hostnames on control and worker nodes to make it easier to know which node you are on
   - Control
      - `sudo hostnamectl set-hostname k8s-control`
   - Workers
     - `sudo hostnamectl set-hostname k8s-worker1`
     - `sudo hostnamectl set-hostname k8s-worker2`
   - Logout and log back in on all the nodes
-  Edit host files to allow nodes to talk to each other using new hostnames
   - `sudo vi /etc/hosts` on all the nodes
   - Add private ips of all nodes with new hostnames
     - `k8s-control-private-ip` k8s-control
     - `k8s-worker1-private-ip` k8s-worker1
     - `k8s-worker1-private-ip` k8s-worker2

## Set up
- Run the `init.sh` script on all 3 nodes (control and worker nodes).
- Run the `control-setup.sh` script **only** on the control node.
- Copy the join command from the output of `control-setup.sh` script execution and run on all worker nodes.
- Run `kubectl get nodes` to see all nodes, if everything went well.
