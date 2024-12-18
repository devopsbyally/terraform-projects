resource "aws_instance" "ec2_instance" {
  count           = var.instance_count
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.security_groups
  subnet_id       = var.subnet_id
  associate_public_ip_address = true
  tags            = var.tags
}

resource "aws_eip" "lb" {
  count    = var.create_eip ? var.instance_count : 0
  instance = aws_instance.ec2_instance[count.index].id
  domain   = "vpc"
  tags     = var.tags
}