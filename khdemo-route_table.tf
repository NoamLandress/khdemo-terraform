# Creates a Route Table
resource "aws_route_table" "khdemo-route_table" {
  vpc_id = aws_vpc.khdemo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.khdemo-igw.id
  }
}

# Creates an association between the Route Table and the Subnet
resource "aws_route_table_association" "khdemo-rta" {
  subnet_id      = aws_subnet.khdemo-subnet.id
  route_table_id = aws_route_table.khdemo-route_table.id
}

