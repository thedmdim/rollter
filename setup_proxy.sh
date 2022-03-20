#!/bin/sh
tinyproxy
i2pd --daemon
su tor -s /bin/sh -c "/usr/bin/tor -f /etc/tor/torrc"
/opt/src/run.sh