#!/bin/bash


apt update
apt install wget vim unzip apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

echo -e "\033[0;34m ################## \033[0m"
echo -e "\033[0;34m Installer Docker \033[0m"
echo -e "\033[0;34m ################## \033[0m"

rm -rf /etc/apt/sources.list.d/docker.list*
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo service docker start

## Installer kubectl
echo -e "\033[0;34m ################## \033[0m"
echo -e "\033[0;34m Installer Kubectl  \033[0m"
echo -e "\033[0;34m ################## \033[0m"
rm -rf /etc/apt/sources.list.d/kubernetes.list*
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl
## Auto-completion
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

echo -e "\033[0;34m ################## \033[0m"
echo -e "\033[0;34m Installer Helm \033[0m"
echo -e "\033[0;34m ################## \033[0m"
wget https://get.helm.sh/helm-v3.10.1-linux-386.tar.gz -O /tmp/helm.tar.gz && tar -xvf /tmp/helm.tar.gz -C /tmp/ && mv /tmp/linux-386/helm /usr/local/bin


echo -e "\033[0;34m ################## \033[0m"
echo -e "\033[0;34m Installer Minikube \033[0m"
echo -e "\033[0;34m ################## \033[0m"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --force

echo -e "\033[0;34m ################## \033[0m"
echo -e "\033[0;34m Installer Traefik \033[0m"
echo -e "\033[0;34m ################## \033[0m"
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik

