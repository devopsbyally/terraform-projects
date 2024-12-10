variable "bucket_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_tags" {
  type = map(string)
}

variable "key_pair_name" {
  description = "EC2 key pair to be used for SSH access"
  type = string  
}