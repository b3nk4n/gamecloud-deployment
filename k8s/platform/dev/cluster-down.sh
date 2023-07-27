#!/bin/sh

echo "\n💥  Destroying Kubernetes cluster...\n"

minikube stop --profile gamecloud

minikube delete --profile gamecloud

echo "\n✅  Cluster destroyed\n"