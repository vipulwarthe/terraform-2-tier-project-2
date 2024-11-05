#Internet Gateway

resource "aws_internet_gateway" "two-tier-igw" {
  vpc_id = aws_vpc.two-tier-vpc.id

  tags = {
    Name = "two-tier-igw"
  }
}