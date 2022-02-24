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