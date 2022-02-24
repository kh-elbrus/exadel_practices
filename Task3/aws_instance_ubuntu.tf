resource "aws_instance" "ubuntu" {
  ami           = var.ubuntu-ami
  instance_type = var.instance-type
  key_name = "ubuntu-ssh"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.ubuntu-nic.id
  }

  user_data = file("./ngxi.sh")

  tags = var.ubuntu-tags
}