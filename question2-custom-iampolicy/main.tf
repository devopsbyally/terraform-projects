# Step 1: create a security group for SSH and HTTP
resource "aws_security_group" "ssh_and_http_sg" {
  name        = "ssh-and-http-sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description = "Allow SSH (Port 22)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP (Port 80)"
    from_port   = 80
    to_port     = 80
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
    Name = "ssh-and-http-sg"
  }
}

# Step 2: IAM policy to read and write access to S3
resource "aws_iam_policy" "s3_read_write_policy" {
  description = "Read and write access to ${var.bucket_name}"
  policy = templatefile("${path.module}/iam-policy.json", {
    bucket_name = var.bucket_name
  })
}

# Step 3: IAM role for EC2 instance
resource "aws_iam_role" "ec2_role" {
  name = "ec2-accessrole-for-s3"
  assume_role_policy = templatefile("${path.module}/iam-role-policy.json", {})
}

# Step 4: attach the IAM policy to the IAM Role
resource "aws_iam_role_policy_attachment" "ec2_role_policy_attachment" {
  role = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_read_write_policy.arn
}

# Step 5: create IAM instance profile to link IAM role to EC2 instance
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-access-instance-profile"
  role = aws_iam_role.ec2_role.name
}

# Step 6: create EC2 instance with IAM Role & attached Security Groups
resource "aws_instance" "ec2_with_s3_access" {
  ami                  = var.ami_id
  key_name             = var.key_pair_name
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  security_groups      = [aws_security_group.ssh_and_http_sg.name]

  tags = var.instance_tags
}
