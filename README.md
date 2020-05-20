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
        k exec -it -n default netshoot-deploy-<TAB> -- curl classic-service
        ```

* from the classic/legacy part the service `svc` of the `cloud-native` cluster is accessible: 

        ```
        cd 0-classic && docker-compose up connecttocloudnative
        ```


## L7 Performance (inlets OSS)

__single request for a big file (500MB)__

|Source\Destination     |Cloud-Native   |Legacy         |
|-|-|-|
|Cloud-Native           |609MB/s        |200MB/s        |
|Legacy                 |147MB/s        |708MB/s        |

__200 parallel requests for a small file (1KB)__

|Source\Destination     |Cloud-Native   |Legacy         |
|-|-|-|
|Cloud-Native           |16.0MB/s       |1.78MB/s       |
|Legacy                 |2.3MB/s        |14.66MB/s      |

__95th percentile for latency__

|Source\Destination     |Cloud-Native   |Legacy |
|-|-|-|
|Cloud-Native           |7ms            |347ms  |
|Legacy                 |176ms          |12ms   |

## L4 Performance (inlets-pro)

|                       | pgbench tps   | pgbench latency       | iperf throughput      |
|-|-|-|-|
|Legacy                 | 47000         | 2ms                   | 35Gbit/s              |
|Cloud-Native -> Legacy | 12000         | 7ms                   | 4.8GBit/s             |
