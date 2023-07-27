#!/bin/sh

do_wait() {
    echo "\n⏳  Waiting for $1 to be deployed..."

    while [ $(kubectl get pod -l $2 | wc -l) -eq 0 ] ; do
        sleep $3
    done

    echo "\n⏳  Waiting for $1 to be ready..."

    kubectl wait \
        --for=condition=ready pod \
        --selector=$2 \
        --timeout=180s
}

echo "\n📦  Initializing Kubernetes cluster...\n"

minikube start --cpus 2 --memory 4g --driver docker --profile gamecloud

echo "\n🔗  Enabling NGINX Ingress Controller...\n"

minikube addons enable ingress --profile gamecloud

sleep 10

echo "\n📦  Deploying platform services..."

kubectl apply -f services

sleep 5

do_wait "Postgres" "db=gamecloud-postgres" 5 

do_wait "Redis" "db=gamecloud-redis" 5 

echo "\n✅  Ready!\n"
