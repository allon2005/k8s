#!/bin/bash

rm -rf kube-prometheus

git clone https://github.com/coreos/kube-prometheus.git

cd kube-prometheus

#remove any previous installation
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup


kubectl create -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f manifests/

#repeate 3 times to make sure all coming up
for i in {1..3}
do 
  kubectl create -f manifests/setup -f manifests
done


