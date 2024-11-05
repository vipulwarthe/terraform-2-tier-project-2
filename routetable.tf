# Route table

resource "aws_route_table" "two-tier-rt" {
  vpc_id = aws_vpc.two-tier-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.two-tier-igw.id
  }

  tags = {
    Name = "two-tier-rt"
  }
}

# Route Table Association

resource "aws_route_table_association" "two-tier-rt-as-1" {
  subnet_id = aws_subnet.two-tier-pub-sub-1.id
  route_table_id = aws_route_table.two-tier-rt.id
}

resource "aws_route_table_association" "two-tier-rt-as-2" {
  subnet_id = aws_subnet.two-tier-pub-sub-2.id
  route_table_id = aws_route_table.two-tier-rt.id
}