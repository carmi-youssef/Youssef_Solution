#!/bin/bash
#add fix to exercise2 here
if [ -f "/etc/hosts" ]; then
    sudo rm /etc/hosts.swp
fi

sudo vim /etc/hosts <<-EOF
    :%s:127.0.0.1 www.ascii-art.de:#127.0.0.1 www.ascii-art.de:g
    :wq
EOF

sudo systemctl restart systemd-resolved
