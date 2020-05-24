# Creates a Subnet within a given VPC
resource "aws_subnet" "khdemo-subnet" {
  vpc_id     = aws_vpc.khdemo-vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-2a"
}

