# Creates an Elastic Ip for the EC2 instance
resource "aws_eip" "khdemo-elastic_ip" {
  instance = aws_instance.khdemo-instance.id
  vpc = true
  depends_on = [aws_internet_gateway.khdemo-igw]
}

# Creates a Key_Pair for the EC2 instance, image recieved through filteration
resource "aws_key_pair" "khdemo-ssh_key"{
  key_name = "khdemo_key_pair"
  public_key = "PUBLIC_KEY_HERE"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Creates an EC2 instance
resource "aws_instance" "khdemo-instance" {
  ami = data.aws_ami.ubuntu.id
  availability_zone = "us-east-2a"  
  instance_type = "t2.micro"
  key_name = "khdemo-key_pair"
  vpc_security_group_ids = [aws_security_group.khdemo-security_group.id]
  subnet_id = aws_subnet.khdemo-subnet.id
}

