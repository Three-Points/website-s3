resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = {
    environment = "storage"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "bucket_configuration" {
  bucket = aws_s3_bucket.bucket.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "application" {
  for_each = fileset("./dist", "**")
  bucket   = aws_s3_bucket.bucket.bucket
  key      = each.key
  source   = "./dist/${each.key}"
  acl      = "public-read"
}
