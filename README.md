# Overview

A collection of helper scripts for different things that can be time consuming.

## Prerequisites
- Set hostnames on control and worker nodes
   - Control
      - sudo hostnamectl set-hostname k8s-control
   - Workers
     - sudo hostnamectl set-hostname k8s-worker1
     - sudo hostnamectl set-hostname k8s-worker2
   - Logout and log back in on all the nodes
-  Edit host files to allow nodes to talk to each other using new hostnames
   - `sudo vi /etc/hosts` on all the nodes
   - Add private ips of all nodes with new hostnames
     - <k8s-control-private-ip> k8s-control
     - <k8s-worker1-private-ip> k8s-worker1
     - <k8s-worker1-private-ip> k8s-worker2
