# Output variables
output "web_public_ip" {
  value = aws_instance.web.public_ip
}

output "web_private_ip" {
  value = aws_instance.web.private_ip
}

output "db_private_ip" {
  value = aws_instance.db.private_ip
}

output "web_instance_id" {
  value = aws_instance.web.id
}

output "db_instance_id" {
  value = aws_instance.db.id
}

output "web_instance_dns" {
  value = aws_instance.web.public_dns
}
