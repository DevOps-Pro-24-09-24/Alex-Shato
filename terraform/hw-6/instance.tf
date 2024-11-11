# EC2 instances
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.sg_FRONT.id]
  key_name        = var.key_name # Using an existing key
  depends_on = [
    aws_security_group.sg_FRONT,
    aws_internet_gateway.igw,
    aws_route_table_association.public
  ]

  tags = {
    Name = "web-instance"
  }
}

resource "aws_instance" "db" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.sg_BACK.id]
  key_name        = var.key_name # Using an existing key
  depends_on = [
    aws_security_group.sg_BACK
  ]

  tags = {
    Name = "db-instance"
  }
}
