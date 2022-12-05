#!/bin/bash

## Use local minikube docker registry
echo -e "\033[0;34m  Local minikube docker registry  \033[0m"
eval $(minikube -p minikube docker-env)

## Build hello and world docker images
echo -e "\033[0;34m  Build apps/hello and apps/world docker images  \033[0m"
docker build -t hello -f apps/hello/Dockerfile apps/hello
docker build -t world -f apps/world/Dockerfile apps/world

## Install APPS
echo -e "\033[0;34m  Install apps/hello and apps/world helm charts  \033[0m"
helm delete hello
helm delete world
helm install hello apps/charts/hello
helm install world apps/charts/world/

