resource "aws_security_group" "allow_traffic_to_centos" {
  name        = "allow_tf_to_centos"
  description = "Allow necessary traffic to centos"
  vpc_id      = aws_vpc.mvpc.id

  tags = var.allow-traffic-to-centos-tags
}

### 
# Private access rules
###

resource "aws_security_group_rule" "private_out_ssh_c" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_centos.id
}

resource "aws_security_group_rule" "private_out_http_c" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_centos.id
}

resource "aws_security_group_rule" "private_out_https_c" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_centos.id
}

resource "aws_security_group_rule" "private_to_ssh_c" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_centos.id
}

resource "aws_security_group_rule" "private_to_http_c" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]
  
  security_group_id = aws_security_group.allow_traffic_to_centos.id
}

resource "aws_security_group_rule" "private_to_https_c" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_centos.id
}