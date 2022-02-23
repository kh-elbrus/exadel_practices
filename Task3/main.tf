provider "aws" {
  region = var.region
}

resource "aws_vpc" "mvpc" {
  cidr_block = "10.0.1.0/24"

  tags = var.main-vpc-tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mvpc.id

  tags = var.internet-gw-tags
}

resource "aws_route_table" "mroute-table" {
  vpc_id = aws_vpc.mvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = var.mroute-table-tags
}

resource "aws_subnet" "msubnet" {
  vpc_id     = aws_vpc.mvpc.id
  cidr_block = "10.0.1.0/24"

  tags = var.msubnet-tags
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.msubnet.id
  route_table_id = aws_route_table.mroute-table.id
}

resource "aws_security_group" "allow_traffic_to_centos" {
  name        = "allow_tf_to_centos"
  description = "Allow necessary traffic to centos"
  vpc_id      = aws_vpc.mvpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 0
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }
  ingress {
    description      = "HTTP"
    from_port        = 0
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }
  ingress {
    description      = "SSH"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }
  ingress {
    description      = "ICMP"
    from_port        = 0
    to_port          = 0
    protocol         = "icmp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }

  egress {
    description      = "HTTPS"
    from_port        = 0
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }
  egress {
    description      = "HTTP"
    from_port        = 0
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }
  egress {
    description      = "SSH"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }
  egress {
    description      = "ICMP"
    from_port        = 0
    to_port          = 0
    protocol         = "icmp"
    cidr_blocks      = [aws_vpc.mvpc.cidr_block]
  }

  tags = var.allow-traffic-to-centos-tags
}

resource "aws_security_group" "allow_traffic_to_ubuntu" {
  name        = "allow_tf_to_ubuntu"
  description = "Allow necessary traffic to ubuntu"
  vpc_id      = aws_vpc.mvpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 0
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 0
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "ICMP"
    from_port        = 0
    to_port          = 0
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.allow-traffic-to-ubuntu-tags
}

resource "aws_network_interface" "centos-nic" {
  subnet_id       = aws_subnet.msubnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_traffic_to_centos.id]
}

resource "aws_network_interface" "ubuntu-nic" {
  subnet_id       = aws_subnet.msubnet.id
  private_ips     = ["10.0.1.49"]
  security_groups = [aws_security_group.allow_traffic_to_ubuntu.id]
}

resource "aws_eip" "cent-one" {
  vpc = true
  network_interface = aws_network_interface.centos-nic.id 
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "ubuntu-two" {
  vpc = true
  network_interface = aws_network_interface.ubuntu-nic.id 
  associate_with_private_ip = "10.0.1.49"
  depends_on = [aws_internet_gateway.gw]
}

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
