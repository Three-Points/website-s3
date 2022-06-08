output "bucket" {
  value = "s3://${aws_s3_bucket.bucket.id}"
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.bucket_configuration.website_endpoint
}
