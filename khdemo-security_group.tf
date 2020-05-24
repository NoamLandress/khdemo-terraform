# Creates a Security Group to enable SSH connections to an instance
resource "aws_security_group" "khdemo-security_group" {
  name        = "Allow SSH Security Group"
  vpc_id      = aws_vpc.khdemo-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

