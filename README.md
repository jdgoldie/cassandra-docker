### cassandra-docker

1. Either `su` or make sure `DOCKER_HOST` is exported

2. Build the cassandra docker image

```
docker build -t dsc208 .
```

#### Use

- Start a cluster of 1,3,5, or 7 nodes.

```
start_cluster.sh [1,3,5,7]
```

Data is written to the `data/` directory and persists across cluster restarts.

- OpsCenter 

OpsCenter is running on the first node that is created.  The IP/Port is returned by the `start_cluster.sh` script


- Stop a cluster

```
stop_cluster.sh
```

- Start a client container

```
client.sh
```

The client container links to the `cass0` container that contains the first cassandra node.

To check the cluster's status from the client container

```
watch -n 5 nodetool -h $IP status
```

The environment variable `IP` has the IP address of the `cass0` node

- SSH

The `root` user has password `docker` and `dropbear` is running on port 22 of each container for ssh access.



This project is forked from Al Tobey's cassandra-docker project at https://github.com/tobert/cassandra-docker


