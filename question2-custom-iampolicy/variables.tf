variable "bucket_name" {
  type = string
  default = "tf-s3bucket-11.12"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ami_id" {
  type = string
  default = "ami-0182f373e66f89c85"
}

variable "instance_tags" {
  type = map(string)
  default = {
    Name = "ec2-accessrole-for-s3"
    Environment = "Dev"
  }
}

variable "key_pair_name" {
  description = "EC2 key pair to be used for SSH access"
  type        = string
  default     = "serverkey"  
}