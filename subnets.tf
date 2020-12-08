//subnets.tf

resource "aws_subnet" "subnet-one" {
  cidr_block = cidrsubnet(aws_vpc.insights-demo.cidr_block, 3, 1)
  vpc_id = aws_vpc.insights-demo.id
  availability_zone = "eu-west-1b"
}

resource "aws_route_table" "route-table-insights-demo" {
  vpc_id = aws_vpc.insights-demo.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.insights-demo-gw.id
  }
  tags = {
    Name = "insights-demo-route-table"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-one.id
  route_table_id = aws_route_table.route-table-insights-demo.id
}