# Creates a VPC which will contain all future resources
resource "aws_vpc" "khdemo-vpc" {
  cidr_block       = "10.1.0.0/16"
  tags = {
    Name = "This VPC is created for an khdemo Exercise"
  }
}

