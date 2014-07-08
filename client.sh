# Get IP address of first node
IP=`docker -H :4243 inspect cass0 | grep IPAddress | cut -d '"' -f 4`

# Start container and set environment variable $IP to the address of node cass0 
# Use: nodetool -h $IP status
docker -H :4243 run -i -t --name client --link cass0:cass0 -e IP=$IP -entrypoint=/bin/bash dsc208
