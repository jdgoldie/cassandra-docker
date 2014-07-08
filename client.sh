# Get IP address of first node
IP=`docker -H :4243 inspect cass0 | grep IPAddress | cut -d '"' -f 4`

# Clean up any old client containers out there
docker -H :4243 ps -a | grep dsc208 | grep Exit |  awk '{print $1}' | xargs docker -H :4243 kill
docker -H :4243 ps -a | grep dsc208 | grep Exit |  awk '{print $1}' | xargs docker -H :4243 rm


# Start container and set environment variable $IP to the address of node cass0 
# Use: nodetool -h $IP status
docker -H :4243 run -i -t --link cass0:cass0 -e IP=$IP -entrypoint=/bin/bash dsc208
