resource "aws_instance" "centos" {
  ami           = var.centos-ami
  instance_type = var.instance-type
  key_name = "centos-ssh"
  
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.centos-nic.id
  }

  user_data = <<EOF
#!/bin/bash
yum -y update
amazon-linux-extras install nginx1
echo '<h1>Hello World From Centos!</h1>' > /usr/share/nginx/html/index.html
sudo systemctl start nginx
EOF
  
  tags = var.centos-tags
}