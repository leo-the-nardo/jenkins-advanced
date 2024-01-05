#
# Public Routing for the VPC
#

# Creation of the IGW in the sample VPC
resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    "Name" = "Jenkins-VPC-IGW"
  }
}

# Primary Sample Route Table (Public)
resource "aws_route_table" "jenkins_public_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    "Name" = "Jenkins-Public-Route-Table"
  }
}

# Update Route Table for IPv6-only Workloads
resource "aws_route" "ipv6_route" {
  route_table_id         = aws_route_table.jenkins_public_rt.id
  destination_ipv6_cidr_block = "::/0"
  gateway_id = aws_internet_gateway.jenkins_igw.id
}

# Create a separate route for IPv4 traffic
resource "aws_route" "ipv4_route" {
  route_table_id         = aws_route_table.jenkins_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.jenkins_igw.id
}

resource "aws_route_table_association" "jenkins-public-rt-subnet-association" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.jenkins_public_rt.id
}


