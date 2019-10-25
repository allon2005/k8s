#!/bin/bash

cd istio-1.3.3

kubectl delete -f install/kubernetes/istio-demo.yaml

for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl delete -f $i; done


