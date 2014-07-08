Fork of Al Tobey's cassandra-docker project.

Follow his instructions to build the image. (https://github.com/tobert/cassandra-docker)

Start a cluster with start_cluster.sh [1,3,5,7] for the number of nodes

Create client container with client.sh.  The $IP environment variable will be the IP address of the cass0 node.

Stop the cluster with stop_cluster.

Data is persisted to disk across restarts.

