data "aws_ami" "rhel" {
  most_recent = true
  owners = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-8*"]
  }
}