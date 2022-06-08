terraform {
  required_version = ">= 1.1.7"

  required_providers {
    aws = {
      version = ">= 4.17.0"
    }
  }
}

provider "terraform" {
  region = "us-east-1"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "threepoints-bucket"
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source              = "./modules/ec2"
  security_group_http = module.vpc.security_group_http_id
  depends_on          = [module.vpc]
}

module "rds" {
  source            = "./modules/rds"
  security_group_db = module.vpc.security_group_db_id
  depends_on        = [module.vpc]
}
