module "ec2_asg" {
  source           = "/Users/alexandras/Desktop/terraform-project/modules/ec2-modules"
  name_prefix      = "example-asg"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  security_groups  = [module.sg.security_group_id]
  subnet_ids       = var.subnet_ids
  desired_capacity = 2
  min_size         = 1
  max_size         = 3
  tags             = var.tags
}

module "sg" {
  source         = "/Users/alexandras/Desktop/terraform-project/modules/s3-modules"
  name_prefix    = "example-sg"
  vpc_id         = var.vpc_id
  ingress_rules  = var.ingress_rules
  egress_rules   = var.egress_rules
  tags           = var.tags
}

module "alb" {
  source          = "/Users/alexandras/Desktop/terraform-project/modules/alb-modules"
  name            = "example-alb"
  security_groups = [module.sg.security_group_id]
  subnet_ids      = var.subnet_ids
  tags            = var.tags
}