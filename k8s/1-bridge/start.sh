#!/bin/bash

kind create cluster --name bridge --config ./kind.yaml
kubectx kind-bridge
kubectl apply -f manifests