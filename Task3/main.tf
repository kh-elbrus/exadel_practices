provider "aws" {
  region = var.region
}

data "cloudinit_config" "centos_ngnx_server" {
  gzip          = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = file("./ngnxi.yml")
  }
}