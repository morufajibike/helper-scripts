#!/bin/sh

# To create /etc/systcl.conf, if not present
sudo modprobe br_netfilter

# On all three nodes, run the following:
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf

# To immediately apply the above config
sudo sysctl -p
