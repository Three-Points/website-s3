output "bucket" {
  value = module.s3.bucket
}

output "website_url" {
  value = module.s3.website_url
}

output "security_group_http" {
  value = module.vpc.security_group_http_id
}

output "security_group_db" {
  value = module.vpc.security_group_db_id
}