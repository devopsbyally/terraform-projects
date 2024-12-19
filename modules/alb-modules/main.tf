resource "aws_lb" "new_lb" {
  name               = var.name
  load_balancer_type = "app-lb"  
  security_groups    = var.security_groups
  subnets            = var.subnet_ids
  tags               = var.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.new_lb.arn  
  port = 80
  protocol = "HTTP"
}
