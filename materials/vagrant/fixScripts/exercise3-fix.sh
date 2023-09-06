#!/bin/bash
#add fix to exercise3 here

if [ -f "/etc/apache2/sites-available/000-default.conf" ]; then
    sudo rm /etc/apache2/sites-available/000-default.conf.swp
fi

sudo vim /etc/apache2/sites-available/000-default.conf <<-EOF
    :%s:Require all denied:Require all granted:g
    :wq
EOF

sudo service apache2 restart
