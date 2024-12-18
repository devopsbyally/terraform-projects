output "ec2_instance_ids" {
  value       = aws_instance.ec2_instance[*].id
  description = "The IDs of the EC2 instances."
}

output "eip_addresses" {
  value       = length(aws_eip.lb) > 0 ? aws_eip.lb[*].public_ip : []
  description = "The Elastic IPs assigned to EC2 instances (if created)."
}
