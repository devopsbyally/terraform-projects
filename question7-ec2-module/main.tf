module "ec2_module" {
  source          = "/Users/alexandras/Desktop/terraform-project/modules/ec2-modules"
  ami_id          = var.ami_id
  region          = var.region
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.security_groups
  subnet_id       = var.subnet_id
  instance_count  = var.instance_count
  create_eip      = var.create_eip
  tags            = merge({
    Name = "my-ec2-module-demo" 
    
  },var.tags)
}
