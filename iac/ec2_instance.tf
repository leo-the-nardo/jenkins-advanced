//IPV6
resource "aws_security_group" "jenkins_sg" {
  name        = "Jenkins-SG"
  description = "Security group for the EC2 instance"
  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "Jenkins-SG"
  }

}


resource "aws_instance" "jenkins_ec2" {
  ami                     = "ami-0c7217cdde317cfec" //TODO: UNHARD CODE THIS
  instance_type           = "t2.micro"
  key_name                = "jenkins"
  ebs_optimized           = false
  disable_api_termination = true
  source_dest_check      = false
  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  ipv6_address_count = 1
  depends_on = [
    aws_internet_gateway.jenkins_igw
  ]
  iam_instance_profile = aws_iam_instance_profile.session_manager_instance_profile.name

  tags = {
    "Name" = "Jenkins-EC2-Instance"
  }

}

output "public_ipv6" {
  value = aws_instance.jenkins_ec2.ipv6_addresses[0]
}
output "instance_id" {
  value = aws_instance.jenkins_ec2.id
}