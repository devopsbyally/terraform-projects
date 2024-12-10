output "ec2_instance_ids" {
  value = aws_instance.ec2_instance[*].id
}

output "eip_addresses" {
  description = "the ec2 instances with eip address"
  value  = aws_eip.elastic_ip[*].public_ip
}
