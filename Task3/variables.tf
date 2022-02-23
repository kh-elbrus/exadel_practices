variable "region" {
  description = "Region that will be used"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "Profile to be used."
  type        = string
  default     = "terraform"
}

variable "ubuntu-ami" {
  description = "ID of Ubuntu AMI"
  type        = string
  default     = "ami-04505e74c0741db8d"
}

variable "centos-ami" {
  description = "ID of Amazon Linux AMI"
  type        = string
  default     = "ami-033b95fb8079dc481"
}

variable "instance-type" {
  description = "The type of instance to start."
  type        = string
  default     = "t2.micro"
}

variable "ubuntu-tags" {
  type = object({
    Name = string
    Apps = string
    Owner = string
  })
}

variable "centos-tags" {
  type = object({
    Name=string
  })
}

variable "main-vpc-tags" {
  type = object({
    Name = string
  })
}

variable "internet-gw-tags" {
  type = object({
    Name = string
  })
}

variable "mroute-table-tags" {
  type = object({
    Name = string
  })
}

variable "msubnet-tags" {
  type = object({
    Name = string
  })
}

variable "allow-traffic-to-centos-tags" {
  type = object({
    Name = string
  })
}

variable "allow-traffic-to-ubuntu-tags" {
  type = object({
    Name = string 
  })
}