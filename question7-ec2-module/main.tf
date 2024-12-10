resource "aws_instance" "ec2_instance" {
  count = var.instance_count
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups #with port 22 opened inbound
  subnet_id = var.subnet_id  
  tags = var.tags
}

resource "aws_eip" "lb" {
  instance = aws_instance.web.id
  domain   = "vpc"
}