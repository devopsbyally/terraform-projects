variable "instance_type" {
    type = string
    default = t2.micro 
}

variable "key_name" {
    type = string
    default = rhel
}

variable "tags" {
    type = map(string)
    default = { 
        "Name" = "jenkins-server-rhel"
    }
}