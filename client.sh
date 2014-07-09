# Get IP address of first node
IP=`docker  inspect cass0 | grep IPAddress | cut -d '"' -f 4`

# Clean up any old client containers out there
docker  ps -a | grep dsc208 | grep Exit |  awk '{print $1}' | xargs docker  kill
docker  ps -a | grep dsc208 | grep Exit |  awk '{print $1}' | xargs docker  rm


# Start container and set environment variable $IP to the address of node cass0 
# Use: nodetool -h $IP status
docker  run -i -t --link cass0:cass0 -e IP=$IP -entrypoint=/bin/bash dsc208
