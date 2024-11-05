# Public Subnet

resource "aws_subnet" "two-tier-pub-sub-1" {
  vpc_id = aws_vpc.two-tier-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "two-tier-pub-sub-1"

  } 
}

resource "aws_subnet" "two-tier-pub-sub-2" {
  vpc_id = aws_vpc.two-tier-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "two-tier-pub-sub-2"
  }
}

resource "aws_subnet" "two-tier-pri-sub-1" {
  vpc_id = aws_vpc.two-tier-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "two-tier-pri-sub-1"
  }
}

resource "aws_subnet" "two-tier-pri-sub-2" {
  vpc_id = aws_vpc.two-tier-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "two-tier-pri-sub-2"
  }
}

# Subnet group database

resource "aws_db_subnet_group" "two-tier-db-sub" {
  name = "two-tier-db-sub"
  subnet_ids = [ aws_subnet.two-tier-pri-sub-1.id, aws_subnet.two-tier-pri-sub-2.id ]  
}
