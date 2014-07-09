# Stop the cluster
#
# Not terribly graceful - does a docker kill/rm on all dsc208 containers
docker  ps -a | grep dsc208 | awk '{print $1}' | xargs docker  kill
docker  ps -a | grep dsc208 | awk '{print $1}' | xargs docker  rm
