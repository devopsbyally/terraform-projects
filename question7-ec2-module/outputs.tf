output "ec2-inst-id" {
  value = module.ec2_module.ec2_instance_ids
}

output "eip_add" {
  description = "the ec2 instances with eip address"
  value  = module.ec2_module.eip_addresses
}
