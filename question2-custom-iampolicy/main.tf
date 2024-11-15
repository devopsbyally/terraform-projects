# Step 1: create a security group for SSH
resource "aws_security_group" "ssh_sg-1" {
  name        = "ssh-sg-1"
  description = "Allow SSH inbound traffic on port 22"

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

# Step 2: create a security group for HTTP 
resource "aws_security_group" "http_sg-1" {
  name        = "http-sg-1"
  description = "Allow HTTP inbound traffic on port 80"

  ingress {
    description = "Allow Port 80"
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
    Name = "http-sg-1"
  }
}

# Step 3: IAM policy to read and write access to S3
resource "aws_iam_policy" "s3_read_write_policy" {
  description = "Read and write access to ${var.bucket_name}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",      
          "s3:PutObject",   
          "s3:ListBucket"      
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",     
          "arn:aws:s3:::${var.bucket_name}/*"    
        ]
      }
    ]
  })
}

# Step 4: IAM role for EC2 instance
resource "aws_iam_role" "ec2_role" {
  name = "ec2-accessrole-for-s3"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Step 5: attach the IAM policy to the IAM Role
resource "aws_iam_role_policy_attachment" "ec2_role_policy_attachment" {
  role = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_read_write_policy.arn
}

# Step 6: create IAM instance profile to link IAM role to EC2 instance
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-access-instance-profile"
  role = aws_iam_role.ec2_role.name
}

# Step 7: create EC2 instance with IAM Role & attached Security Groups
resource "aws_instance" "ec2_with_s3_access" {
  ami = var.ami_id
  key_name = var.key_pair_name
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  security_groups = [
    aws_security_group.ssh_sg-1.name,  
    aws_security_group.http_sg-1.name    
  ]
  tags = var.instance_tags
}
