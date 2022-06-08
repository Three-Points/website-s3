output "security_group_http_id" {
  value = aws_security_group.security_group_http.id
}

output "security_group_db_id" {
  value = aws_security_group.security_group_db.id
}