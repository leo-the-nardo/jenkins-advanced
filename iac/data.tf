data "aws_availability_zones" "available" {
  state = "available"
}


# TODO: take the latest ubuntu image
#data "aws_ami" "ubuntu" {
#  most_recent = true
#
#  owners = ["amazon"]
#
#  filter {
#    name   = "name"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20231207"]
#  }
#
#  filter { //86_64
#    name   = "architecture"
#    values = ["x86_64"]
#  }
#}