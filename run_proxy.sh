#!/bin/sh
tinyproxy -d -c /etc/tinyproxy/tinyproxy.conf &
i2pd &
su tor -s /bin/sh -c "/usr/bin/tor -f /etc/tor/torrc" &
./yggstack -useconffile=/etc/yggdrasil.conf -socks :1080 -exposetcp 80:127.0.0.1:8080 &
/opt/src/run.sh