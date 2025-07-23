resource "aws_s3_bucket" "s3_publicbucket" {
  bucket = var.bucket

  tags = {
    Name        = var.tag_name
    Environment = var.tag_env
  }
}
