#!/bin/bash
#add fix to exercise1 here
if [ -f "/etc/systemd/resolved.conf" ]; then
    sudo rm /etc/systemd/resolved.conf.swp
fi


sudo vim /etc/systemd/resolved.conf <<-EOF
    :%s:#DNS=:DNS=8.8.8.8:g
    :wq
EOF

sudo systemctl restart systemd-networkd.service
