variable "bucket_name" {
  type        = string
  default     = "tf-s3bucket-11.12" 
}

#variable "bucket_pri_acl" {
 # type        = string
  #default     = "private"  
#}

variable "bucket_tags" {
  type        = map(string)
  default = {
    Name        = "My S3 bucket"
    Environment = "Dev"
  }
}

variable "object_key" {
  description = "The key and path for the object in the S3 bucket"
  type        = string
  default     = "images/nature.jpg"
}

variable "object_source" {
  type        = string
  default     = "/Users/alexandras/Desktop/nature.jpg"
}

variable "object_pub_acl" {
  type        = string
  default     = "public-read" 
}

variable "versioning" {
    description = "enable or disable"
    type = string
    default = "Enabled"
}