variable "region" {
  type = string
  default = "us-east-1"
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
  description = "subnet ID for the ec2 instances."
  type = string
}

variable "tags" {
  description = "tags for ec2 instances and eip."
  type = map(string)
}

variable "instance_count" {
  type = number
}

variable "create_eip" {
  description = "If true then it will create eip and attach to ec2"
  type = bool
}