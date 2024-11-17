# Data source to fetch the latest RHEL AMI
data "aws_ami" "rhel" {
  most_recent = true
  owners      = ["self"] 
  filter {
    name   = "name"
    values = ["RHEL-8.*-HVM-*"]
  }
}