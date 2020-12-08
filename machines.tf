//servers.tf
resource "aws_instance" "tower_instance" {
  ami           = "ami-032e5b6af8a711f30"
  instance_type = "t2.large"
  key_name = "insights-demo"
  security_groups = [aws_security_group.ingress-all.id, aws_security_group.allow-tls.id]
  tags = {
    Name = "insights-tower",
    Group = "insights-demo"
  }
  subnet_id = aws_subnet.subnet-one.id  
}

resource "aws_instance" "machine1_instance" {
  ami           = "ami-032e5b6af8a711f30"
  instance_type = "t2.micro"
  key_name = "insights-demo"
  security_groups = [aws_security_group.ingress-all.id]
  tags = {
    Name = "insights-rhel-8-x86",
    Group = "insights-demo"
  }
  subnet_id = aws_subnet.subnet-one.id
}

resource "aws_instance" "machine2_instance" {
  ami           = "ami-04bf89f1458bbef8a"
  instance_type = "t4g.micro"
  key_name = "insights-demo"
  security_groups = [aws_security_group.ingress-all.id]
  tags = {
    Name = "insights-rhel-8-arm",
    Group = "insights-demo"
  }
  subnet_id = aws_subnet.subnet-one.id
}

resource "aws_instance" "machine3_instance" {
  ami           = "ami-8b8c57f8"
  instance_type = "t2.micro"
  key_name = "insights-demo"
  security_groups = [aws_security_group.ingress-all.id]
  tags = {
    Name = "insights-rhel-76-x86",
    Group = "insights-demo"
  }
  subnet_id = aws_subnet.subnet-one.id
}