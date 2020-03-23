#!/bin/bash

IP=$(ip addr show ens10 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)

mkdir -p /etc/systemd/system/docker.service.d/

cat <<EOF > /etc/systemd/system/docker.service.d/startup_options.conf
# /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://$IP:2375
EOF

systemctl daemon-reload
systemctl restart docker.service
