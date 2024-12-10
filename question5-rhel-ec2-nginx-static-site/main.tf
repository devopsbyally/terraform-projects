# Step 1: create a security group to allow HTTP traffic on port 80
resource "aws_security_group" "http-traffic" {
  name        = "http-traffic"
  description = "allow http traffic on port 80"

  ingress {
    description = "allow http (Port 80)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-traffic"
  }
}

# Step 2: create two ec2 instances using count
resource "aws_instance" "rhel_instance" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [aws_security_group.http-traffic.name]

user_data = file("${path.module}/user-data-install-packages.sh")

  tags = {
    Name = "rhel-instance-${count.index + 1}"
  }
}