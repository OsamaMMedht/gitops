output "vpc_id" {
  value       = aws_vpc.my_vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public[*].id
  description = "The ID of the VPC"
}

output "private_subnets_id" {
  value       = aws_subnet.private[*].id
  description = "The ID of the VPC"
}

output "sgid" {
  value = aws_security_group.sc-linux.id
}

output "sgid-rds" {
  value = aws_security_group.rds_sg.id  
}