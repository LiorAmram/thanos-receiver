#!/bin/bash
kubectl create ns thanos

kubectl -n thanos create secret generic thanos-objectstorage --from-file=thanos-s3.yaml
kubectl -n thanos label secrets thanos-objectstorage part-of=thanos

cd manifests

kubectl apply -f thanos-receiver-hashring-configmap-base.yaml
kubectl apply -f thanos-receive-controller.yaml
kubectl apply -f thanos-receive-default.yaml
kubectl apply -f thanos-receive-hashring-0.yaml
kubectl apply -f thanos-receive-service.yaml
kubectl apply -f thanos-store-shard-0.yaml
kubectl apply -f thanos-query.yaml