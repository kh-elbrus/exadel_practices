resource "aws_instance" "centos" {
  ami           = var.centos-ami
  instance_type = var.instance-type
  key_name = "centos-ssh"
  
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.centos-nic.id
  }
  
  tags = var.centos-tags
}
