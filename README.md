# Inlets examples

This repo contains examples to use [github.com/inlets/inlets(-pro)](https://github.com/inlets/inlets).

## Example 1: with docker-compose

`docker-compose.yaml` contains a layer 7 sample where the docker-compose service named `server` exposes a port to the host and in the background an inlet tunnel is used to connect to the service named `web`.


## Example 2: with two kind clusters and a classic/legacy service

* use `k8s/start.sh` `k8s/stop.sh` to start or stop the example.

* example uses two kind clusters: one for a cloud-native cluster and one that acts as a `bridge` between classic/legacy and the cloud-native cluster

* from the `cloud-native` cluster it is possible to reach a classic/legacy service by `k8s` means:

        ```
        kubectx kind-cloud-native
        k exec -it -n default netshoot-deploy-<TAB> -- telnet classic-service 5432
        # port is exposed as host port and accessible from your machine with
        psql -h localhost -U postgres -p 30084
        ```

### L7 Throughput (1 request for a big file)

|Source\Destination     |Cloud-Native   |Legacy         |
|-|-|-|
|Cloud-Native           |609MB/s        |200MB/s        |
|Legacy                 |147MB/s        |708MB/s        |

### L7 Throughput (200 parallel requests for a small file)

|Source\Destination     |Cloud-Native   |Legacy         |
|-|-|-|
|Cloud-Native           |16.0MB/s       |1.78MB/s       |
|Legacy                 |2.3MB/s        |14.66MB/s      |

### L7 Latency (95th percentile)

|Source\Destination     |Cloud-Native   |Legacy |
|-|-|-|
|Cloud-Native           |7ms            |347ms  |
|Legacy                 |176ms          |12ms   |
