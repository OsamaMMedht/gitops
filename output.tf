output "vpc_id" {
  value = module.main_vpc.vpc_id
}

output "public_subnets_id" {
  value = module.main_vpc.public_subnet_id
}

output "private_subnets_id" {
  value = module.main_vpc.private_subnets_id
}

output "sg" {
  value = module.main_vpc.sgid
}

output "sgrds" {
  value = module.main_vpc.sgid-rds
}

output "s3_bucketname" {
  value = module.public_bucket.s3
}

output "iam_username" {
  value = module.new_iam_user.iam_username
  
}

output "iam_policy" {
  value = module.admin_policy.policy_arn  
}

output "access_key" {
  value = module.new_iam_user.access_key_id
  
}

output "access_token" {
  value = module.new_iam_user.secret_access_key  
  sensitive = true
}

output "db_endpoint" {
  value = module.rds.endpoint
}

output "db_arn" {
  value = module.rds.arn
}