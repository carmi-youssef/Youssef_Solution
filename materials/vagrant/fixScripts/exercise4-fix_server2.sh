#!/bin/bash
#add fix to exercise4-server2 here
if [ -f "/etc/hosts" ]; then
    sudo rm /etc/.hosts.swp
fi

echo "192.168.60.10 server1" | sudo tee -a /etc/hosts
if [ -f "/etc/ssh/ssh_config" ]; then
    sudo rm /etc/ssh/ssh_config.swp
fi

echo "StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config
