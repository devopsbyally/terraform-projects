output "security_group_id" {
  description = "sg id"
  value = aws_security_group.new-sg.id
}
