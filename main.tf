module "main_vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.30.0.0/16"
  public_subnets_cidr  = ["10.30.21.0/24", "10.30.22.0/24"]
  private_subnets_cidr = ["10.30.46.0/24", "10.30.47.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  enable_public_ip     = "true"
  enable_dns           = "true"
  vpc_name             = "gitops-vpc"
  sgname = "gitops-ssh"
}

module "public_bucket" {
  source   = "./modules/s3"
  bucket   = "gitops-bucket-os"
  tag_name = "gitops"
  tag_env  = "gitopsdev"
}

module "new_iam_user" {
  source   = "./modules/iam"
  iam_user = "admin-user"
  policy_arn = module.admin_policy.policy_arn
}

module "admin_policy" {
  source             = "./modules/iam_policy"
  policy_name        = "ec2-admin"
  policy_description = "EC2 admins"
  policy_document    = data.aws_iam_policy_document.s3_ec2_admin.json
}

module "ec2" {
  source              = "./modules/ec2"
  subnet_id           = module.main_vpc.public_subnet_id[0]
  security_group_id   = module.main_vpc.sgid
  key_name            = "my-key"
  associate_public_ip = true
  instance_name       = "test-instance-dev"
}

module "ec2-bastion" {
  source              = "./modules/ec2"
  subnet_id           = module.main_vpc.private_subnets_id[0]
  security_group_id   = module.main_vpc.sgid
  key_name            = "my-key"
  associate_public_ip = false
  instance_name       = "bastion-dev"
}

module "rds" {
  source              = "./modules/rds"
  name                = "dev-postgres"
  db_name             = "db"
  subnet_ids          = module.main_vpc.private_subnets_id
  security_group_ids  = [module.main_vpc.sgid-rds]
  publicly_accessible = false
  multi_az            = false
}
