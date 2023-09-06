#!/bin/bash
#add fix to exercise5-server1 here
ssh-keygen -t rsa -b 2048 -C "vagrant@server1" -f "/home/vagrant/.ssh/id_rsa"
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa

root_public_key=$(cat ~/.ssh/id_rsa.pub)
root_private_key=$(cat ~/.ssh/id_rsa)
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
sudo chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub
vagrant_public_key=$(cat /home/vagrant/.ssh/id_rsa.pub)
vagrant_private_key=$(cat /home/vagrant/.ssh/id_rsa)

if [ -f "/etc/hosts" ]; then
    sudo rm /etc/.hosts.swp
fi

echo "192.168.60.11 server2" | sudo tee -a /etc/hosts
echo "StrictHostKeyChecking no" | sudo tee -a /etc/ssh/ssh_config
echo "$vagrant_public_key" > /vagrant/fixScripts/vagrant_server1_public_key
echo "$vagrant_public_key" >> /home/vagrant/.ssh/authorized_keys
echo "$vagrant_private_key" > /vagrant/fixScripts/vagrant_server1_private_key
echo "$root_public_key" > /vagrant/fixScripts/root_server1_public_key
echo "$root_private_key" > /vagrant/fixScripts/root_server1_private_key
echo "$root_public_key" >> ~/.ssh/authorized_keys
