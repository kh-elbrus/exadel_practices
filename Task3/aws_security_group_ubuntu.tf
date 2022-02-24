resource "aws_security_group" "allow_traffic_to_ubuntu" {
  name        = "allow_tf_to_ubuntu"
  description = "Allow necessary traffic to ubuntu"
  vpc_id      = aws_vpc.mvpc.id

  tags = var.allow-traffic-to-ubuntu-tags
}

### 
# Public access rules
###

resource "aws_security_group_rule" "public_out_u" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  
  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "public_to_ssh_u" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "public_to_http_u" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "public_to_https_u" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

### 
# Private access rules
###

resource "aws_security_group_rule" "private_out_u" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "private_to_ssh_u" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "private_to_http_u" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "private_to_https_u" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}