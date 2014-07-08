# Stop the cluster
#
# Not terribly graceful - does a docker kill/rm on all dsc208 containers
docker -H :4243 ps -a | grep dsc208 | awk '{print $1}' | xargs docker -H :4243 kill
docker -H :4243 ps -a | grep dsc208 | awk '{print $1}' | xargs docker -H :4243 rm
