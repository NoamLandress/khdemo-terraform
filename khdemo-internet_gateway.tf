# Creates an internet gateway
resource "aws_internet_gateway" "khdemo-igw" {
  vpc_id = aws_vpc.khdemo-vpc.id
}

