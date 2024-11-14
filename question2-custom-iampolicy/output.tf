output "ec2_instance_id" {
  value = aws_instance.ec2_with_s3_access.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.ec2_with_s3_access.public_ip
}

output "s3_read_write_policy_arn" {
  value = aws_iam_policy.s3_read_write_policy.arn
}
