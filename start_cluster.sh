#!/bin/bash
#
# Use start_cluster.sh [nodes]
# where [nodes] = 1/3/5/7
#
# Get the path of the script; data dir created 
DIR=$( cd "$( dirname "$0" )" && pwd )

# Create an initial node (cass0) used to link cluster together
mkdir -p $DIR/data/cass0
docker -H :4243 run -d --name cass0 -p 9042:9042 -p 9160:9160 -v $DIR/data/cass0:/var/lib/cassandra dsc208
IP=`docker -H :4243 inspect cass0 | grep IPAddress | cut -d '"' -f 4`

#
# Determine additional nodes to create
#
if (("$1" >= "3"));
then 

	# Create nodes 2 and 3
	mkdir -p $DIR/data/{cass1,cass2}
	docker -H :4243 run -d --name cass1 -e SEEDS=$IP -v $DIR/data/cass1:/var/lib/cassandra dsc208	
	docker -H :4243 run -d --name cass2 -e SEEDS=$IP -v $DIR/data/cass2:/var/lib/cassandra dsc208

  if (("$1" >= "5"));
  then

  	# Create nodes 4 and 5
	mkdir -p $DIR/data/{cass3,cass4}
	docker -H :4243 run -d --name cass3 -e SEEDS=$IP -v $DIR/data/cass3:/var/lib/cassandra dsc208	
	docker -H :4243 run -d --name cass4 -e SEEDS=$IP -v $DIR/data/cass4:/var/lib/cassandra dsc208


    if (("$1" > "5"));
    then

      # Create nodes 6 and 7
	  mkdir -p $DIR/data/{cass5,cass6}
	  docker -H :4243 run -d --name cass5 -e SEEDS=$IP -v $DIR/data/cass5:/var/lib/cassandra dsc208	
	  docker -H :4243 run -d --name cass6 -e SEEDS=$IP -v $DIR/data/cass6:/var/lib/cassandra dsc208

    fi


  fi

fi

