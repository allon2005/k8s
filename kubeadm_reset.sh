#!/bin/bash

kubectl delete all -all

docker stop $(docker ps -aq) && docker rm $(docker ps -aq)

kubeadm reset -f

iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X

rm $HOME/.kube/config

netstat -tulpn | grep 1025


kubectl cluster-info
