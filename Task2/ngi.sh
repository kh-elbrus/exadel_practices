#!/bin/bash

sudo apt update

# download sources
echo "[!] - Download nginx"
sudo apt install nginx -y

# setup autoruns
echo "[!] - Adding nginx to autorun"
sudo systemctl enable nginx

# Create group and add it user.
echo "[!] - Creating user and group for nginx"
sudo groupadd nginx
sudo useradd -r -g nginx nginx

# Installing PHP & extensions
echo "[!] - Installing php"
sudo apt install php -y
sudo apt install php7.4-fpm php7.4-cli php7.4-mysql php7.4-curl php7.4-json -y
sudo systemctl start php7.4-fpm
sudo systemctl enable php7.4-fpm

# Configure Nginx to Process PHP Files
echo "[!] - Modifying nginx conf"
curl https://pastebin.com/raw/JX2L5UE8 -o ngc.txt
cat ngc.txt | sudo tee /etc/nginx/sites-available/default

# check nginx configs
sudo nginx -t

# reload conf
sudo systemctl reload nginx

# change index file
echo "[!] - Index file"
echo '''                                                                                                           
<h1>Hello world!</h1>        

<h2>OS Version</h2>

<?php                         

$os = shell_exec("uname -a");  

echo $os;                                                              

?>                                                                     

''' | sudo tee /var/www/html/index.php

sudo service nginx reboot
sudo service nginx status