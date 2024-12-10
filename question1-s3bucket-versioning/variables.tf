variable "bucket_name" {
  type        = string
}

#variable "bucket_pri_acl" {
 # type        = string
  #default     = "private"  
#}

variable "bucket_tags" {
  type        = map(string)
}

variable "object_key" {
  description = "The key and path for the object in the S3 bucket"
  type        = string
}

variable "object_source" {
  type        = string
}

variable "object_pub_acl" {
  type        = string
}

variable "versioning" {
    description = "enable or disable"
    type = string
}