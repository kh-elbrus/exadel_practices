resource "aws_instance" "ubuntu" {
  ami           = var.ubuntu-ami
  instance_type = var.instance-type
  key_name = "ubuntu-ssh"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.ubuntu-nic.id
  }

  user_data = <<EOF
#!/bin/bash
apt update -y
apt install nginx -y 
sudo systemctl enable nginx
rm /var/www/html/*.html
echo '<h1>Hello world!</h1>' > /var/www/html/index.html
uname -a >> /var/www/html/index.html
apt install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update -y
apt install docker-ce docker-ce-cli containerd.io -y
docker --version >> /var/www/html/index.html
sudo systemctl start nginx
EOF

  tags = var.ubuntu-tags
}