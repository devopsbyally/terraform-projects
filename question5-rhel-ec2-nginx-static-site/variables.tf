variable "instance_count" {
    type = number
}

variable "ami" {
    description = "ami-id"
    type = string
}

variable "instance_type" {
    type = string 
} 

variable "key_name" {
    type = string
}