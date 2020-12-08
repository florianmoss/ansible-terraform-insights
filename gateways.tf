//gateways.tf
resource "aws_internet_gateway" "insights-demo-gw" {
  vpc_id = aws_vpc.insights-demo.id
tags = {
    Name = "insights-demo-gw"
  }
}