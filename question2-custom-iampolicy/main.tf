resource "aws_instance" "ec2_with_s3_access" {
  ami = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_role.ec2_role.name
  tags = {
    Name = var.instance_tags.id
  }
}


