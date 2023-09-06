#!/bin/bash
#add fix to exercise5-server2 here

vagrant_server1_public_key=$(cat /vagrant/fixScripts/vagrant_server1_public_key)
vagrant_server1_private_key=$(cat /vagrant/fixScripts/vagrant_server1_private_key)

root_server1_public_key=$(cat /vagrant/fixScripts/root_server1_public_key)
root_server1_private_key=$(cat /vagrant/fixScripts/root_server1_private_key)

echo "$vagrant_server1_public_key" >> /home/vagrant/.ssh/authorized_keys
touch /home/vagrant/.ssh/vagrant_server1_private_key
echo "$vagrant_server1_private_key" >> /home/vagrant/.ssh/vagrant_server1_private_key

sudo chown vagrant:vagrant /home/vagrant/.ssh/vagrant_server1_private_key
sudo chmod 600 /home/vagrant/.ssh/vagrant_server1_private_key

echo "$root_server1_public_key" >> ~/.ssh/authorized_keys
echo "$root_server1_private_key" >> ~/.ssh/root_server1_private_key
sudo chmod 600 ~/.ssh/root_server1_private_key

if [ -f "/etc/hosts" ]; then
    echo "Removing existing swap file..."
    sudo rm /etc/.hosts.swp
fi

echo "192.168.60.10 server1" | sudo tee -a /etc/hosts
echo "StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config
