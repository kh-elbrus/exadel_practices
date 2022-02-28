# data "cloudinit_config" "centos_ngnx_server" {
#   gzip          = true
#   base64_encode = true
#   part {
#     content_type = "text/cloud-config"
#     content = file("./configs/ngnxi.yml")
#   }
# }