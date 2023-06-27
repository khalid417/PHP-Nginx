#!/bin/bash
exitedServers=$(/usr/local/bin/docker ps --format '{{.Names}}' --filter "ancestor=unity.server" --filter "status=exited")
for i in {1..8}
do
    test=$(echo "$exitedServers" | grep "server$i")
    if [ -n "${test}" ]
    then 
        /usr/local/bin/docker start $test
        curl http://nginx:80/update.php?instance=$test
    fi
done