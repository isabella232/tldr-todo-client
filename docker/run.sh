#!/bin/bash

if [ "$BACKENDS" == "" ]; then
    echo "Must provide at least a backend host using environment variable BACKENDS, or more than one separated with commas"
    exit -1
fi

# split variable into backends
IFS="," read -a backend_array <<< "$BACKENDS"

# Prepare the list of backend servers for nginx
newline=$'\n'
nginx_servers=""
for backend in "${backend_array[@]}"
do
        nginx_servers="${nginx_servers}server ${backend};"
done

echo "==========="
echo "Starting Nginx container"
echo "Backends:"
echo "$nginx_servers"
echo "==========="

# modify the nginx file
NGINX_BACKEND_SERVERS=$nginx_servers /confd -onetime -backend env

/usr/sbin/nginx -c /etc/nginx/nginx.conf