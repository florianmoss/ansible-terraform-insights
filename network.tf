//network.tf
resource "aws_vpc" "insights-demo" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "insights-demo"
  }
}

resource "aws_eip" "ip-insights-tower" {
  instance = aws_instance.tower_instance.id
  vpc      = true
}

resource "aws_eip" "ip-insights-instance1" {
  instance = aws_instance.machine1_instance.id
  vpc      = true
}

resource "aws_eip" "ip-insights-instance2" {
  instance = aws_instance.machine2_instance.id
  vpc      = true
}

resource "aws_eip" "ip-insights-instance3" {
  instance = aws_instance.machine3_instance.id
  vpc      = true
}