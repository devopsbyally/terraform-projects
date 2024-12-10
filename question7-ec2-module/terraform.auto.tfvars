region         = "us-east-1"
ami_id         = "ami-0182f373e66f89c85"
instance_type  = "t2.micro"
key_name       = "serverkey"
security_groups = ["sg-00e7e2227959bb75f"]
subnet_id      = "subnet-08eaa7d746962455d"
instance_count = 4
create_eip     = true
tags = { 
  Name = "my-ec2-module-demo" #ec2 instance tag
}
