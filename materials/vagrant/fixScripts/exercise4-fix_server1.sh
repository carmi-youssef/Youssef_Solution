#!/bin/bash
#add fix to exercise4-server1 here
if [ -f "/etc/hosts" ]; then
    sudo rm /etc/.hosts.swp
fi
echo "192.168.60.11 server2" | sudo tee -a /etc/hosts

if [ -f "/etc/ssh/ssh_config" ]; then
    sudo rm /etc/ssh/ssh_config.swp
fi

echo "StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config
