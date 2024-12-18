variable "region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "subnet_id" {
  type = string
  description = "Subnet ID for EC2 instances"
}

variable "tags" {
  type = map(string)
  description = "Tags to apply to EC2 resources"
}

variable "instance_count" {
  type = number
  default = 1
}

variable "create_eip" {
  type = bool
  default = false
  description = "If true, create Elastic IPs and associate them with the EC2 instances"
}
