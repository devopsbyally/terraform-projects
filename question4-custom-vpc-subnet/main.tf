# Step 1: fetch the custom VPC by name


# Step 2: fetch the custom subnet by name within the VPC


# Step 3: create in the custom VPC via SG
resource "aws_security_group" "ssh-sg-1" {
  name = "custom-ec2-sg"
  description = "create sg for ec2 instance"

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg-1"
  }
}

# Step 4: create ec2 instance
resource "aws_instance" "ec2_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  security_groups = [
    aws_security_group.ec2_sg.name
  ]
  tags = {
    Name = "custom-ec2-instance"
  }
}
