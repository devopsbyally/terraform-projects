# Output the public IPs, DNS names, and Instance IDs of the EC2 instances
output "instance_public_ips" {
  value = aws_instance.rhel_instance[*].public_ip
}

output "instance_public_dns" {
  value = aws_instance.rhel_instance[*].public_dns
}

output "instance_ids" {
  value = aws_instance.rhel_instance[*].id
}