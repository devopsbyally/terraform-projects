variable "region" {
  type    = string
  default = "us-east-1" 
}

variable "bucket_name" {
  type    = string
  default = "tf-s3bucket-11.11"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-0182f373e66f89c85"
}

variable "instance_tags" {
  type        = map(string)
  default     = {
    Name = "ec2-accessrole-for-s3"
  }
}
