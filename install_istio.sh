#!/bin/bash

rm -rf istio-1.3.3

curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.3.3 sh -

cd istio-1.3.3

export PATH=$PWD/bin:$PATH

for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done


sleep 20

kubectl apply -f install/kubernetes/istio-demo.yaml


kubectl -n istio-system get pods
