# Using this deployment
__________________________

## Prerequisites

* Ubuntu VM (2CPU, 4G RAM, 20G DISK)

## Changes that have been made

1. apps/hello

In the `apps/hello/src/index.js` file, I changed the root path `/` to `/hello` so that this path is available from the outside.

2. apps/world

In the `apps/world/composer.json` file, I changed the listening ip `localhost` to `0.0.0.0` so that the server is available outside the container.

## Dockerfile

1. apps/hello

Dockerfile is located in the path `apps/hello/`.

2. apps/world

Dockerfile is located in the path `apps/world/`.

## Helm Charts

1. apps/hello

Helm chart of `apps/hello` app is located in `apps/charts/hello` path and deploy in the `hello` namespace. 

2. apps/world

Helm chart of `apps/world` app is located in `apps/charts/world` path and deploy in the `world` namespace.

## Usage

* Run the script `init-script.sh` to install the prequisites of deployment. 

* In another window, start the tunnel to create a routable IP for type LoadBalancer service: `minikube tunnel`

* Traefik use the **Loadbalancer service**. Get traefik `EXTERNAL-IP` by running `kubectl get service traefik`.

* And Add entry in our **/etc/hosts** file to route `ornikar.dev`.

* Run the script `install_apps.sh` to build and install `apps/hello` and `apps/world` apps.

```
./init-script.sh
./install_apps.sh
```

## Verification

* curl http://ornikar.dev/hello

* curl http://ornikar.dev/world


