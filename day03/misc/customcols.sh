#!/bin/sh 
#
# get the listing as yaml
kubectl get po/cilium-5q7dt -nkube-system -oyaml
# custom colums
kubectl get po -A \
	-o custom-columns="NAMESPACE:.metadata.namespace, NAME:.metadata.name, IMAGE:.spec.containers[].image"
