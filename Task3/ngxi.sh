#cloud-boothook
#!/bin/bash

sudo apt update -y
sudo apt install nginx -y
sudo apt install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo rm /var/www/html/*.html
sudo touch /var/www/html/index.html
echo 'Hello world!' | sudo tee /var/www/html/index.html
sudo uname -a >> /var/www/html/index.html
sudo docker version --format '{{.Server.Version}}'
sudo nginx -v
