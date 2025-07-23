output "iam_username" {
  value = aws_iam_user.user.arn
}

output "access_key_id" {
  value = aws_iam_access_key.key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.key.secret
  sensitive = true
}