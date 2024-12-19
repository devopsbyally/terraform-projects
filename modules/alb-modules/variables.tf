variable "name" {
  description = "load balancer name"
  type = string
}

variable "security_groups" {
  description = "alb for sg"
  type  = list(string)
}

variable "subnet_ids" {
  description = "subnet ids for alb"
  type = list(string)
}

variable "tags" {
  description = "Tags for alb"
  type = map(string)
}
