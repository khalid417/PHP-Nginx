#!/bin/bash
chmod 0777 /var/run/docker.sock
exitedServers=$(/usr/local/bin/docker ps --format '{{.Names}}' --filter "ancestor=unity.server" --filter "status=exited")
for i in {1..8}
do
    test=$(echo "$exitedServers" | grep "server$i")
    if [ -n "${test}" ]
    then 
        /usr/local/bin/docker start $test
    fi
done