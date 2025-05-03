#!/bin/bash

if [ "$1" == "start" ]; then
    docker-compose up -d
    echo "[+] Login page http://$(hostname -I | awk '{print $1}'):8011"
elif [ "$1" == "stop" ]; then
    docker-compose down
elif [ "$1" == "get-password" ]; then
    docker logs $(docker ps | grep javachains/javachains | awk '{print $1}') | grep -E 'password'
else
    echo "Usage: $0 {start|stop|get-password}"
    exit 1
fi 