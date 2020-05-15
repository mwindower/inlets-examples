# Inlets examples

This repo contains examples to use github.com/inlets/inlets(-pro).

## Example 1: with docker-compose

`docker-compose.yaml` contains a layer 7 sample where the docker-compose service named `server` exposes a port to the host and in the background an inlet tunnel is used to connect to the service named `web`.


## Example 2: with two kind clusters and a classic/legacy service

* use `k8s/start.sh` `k8s/stop.sh` to start or stop the example.

* example uses two kind clusters: one for a cloud-native cluster and one that acts as a `bridge` between classic/legacy and the cloud-native cluster

* from the `cloud-native` cluster it is possible to reach a classic/legacy service by `k8s` means:

        ```
        kubectx kind-cloud-native
        k exec -it -n default netshoot-deploy-<TAB> -- curl classic-service
        ```

* from the classic/legacy part the service `svc` of the `cloud-native` cluster is accessible: 

        ```
        cd 0-classic && docker-compose up connecttocloudnative
        ```