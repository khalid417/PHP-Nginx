#!/bin/bash
exitedServers=$(docker ps --format '{{.Names}}' --filter "ancestor=unity.server" --filter "status=exited")
for i in {1..8}
do
    test=$(echo "$exitedServers" | grep "server$i")
    if [ -z "$test" ]
    then 
        docker start $test
        curl http://nginx:80/update?instance=$test
    fi
done