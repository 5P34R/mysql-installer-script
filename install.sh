#!/bin/bash

if [[ $0 && $1 ]]
then
        clear
        sudo apt update
        sudo apt install mysql-server
        sudo apt install cowsay
        sudo apt install wget
        cd /tmp
        wget "https://dev.mysql.com/get/mysql-apt-config_0.8.20-1_all.deb"
        sudo dpkg -i mysql-apt-config_0.8.20-1_all.deb
        sudo systemctl start mysql.service
        
        
        sudo mysql -u root -e "CREATE USER '$1'@'localhost' IDENTIFIED BY '$2';"
        sudo mysql -u root -e "GRANT ALL PRIVILEGES ON * . * TO '$1'@'localhost';";
        sudo mysql -u root -e "FLUSH PRIVILEGES;"

        notify-send "Installation completed"
        mysql-benchwork
        cowsay Logined as $1 using password $2
        mysql -u $1 -p$2
else
        echo "Usage: ./install username password"
fi
~
