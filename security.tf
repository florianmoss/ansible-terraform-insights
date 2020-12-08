//security.tf
resource "aws_security_group" "ingress-all" {
name = "allow-all-sg"
vpc_id = aws_vpc.insights-demo.id
ingress  {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
// Terraform removes the default rule
  egress  {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_security_group" "allow-tls" {
name = "allow-tls"
vpc_id = aws_vpc.insights-demo.id
ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
// Terraform removes the default rule
  egress  {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}