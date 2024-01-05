# Creation of the sample VPC for the region
resource "aws_vpc" "jenkins_vpc" {
  cidr_block                       = var.vpc_cidr
  assign_generated_ipv6_cidr_block = true
  tags = {
    "Name" = "Jenkins-VPC"
  }
}