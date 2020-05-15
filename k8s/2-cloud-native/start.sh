#!/bin/bash

kind create cluster --name cloud-native --config ./kind.yaml
kubectx kind-cloud-native
kubectl apply -f manifests