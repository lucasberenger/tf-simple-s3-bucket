provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "bucket-created-by-terraform-2024-10-26"
}

resource "aws_s3_bucket_ownership_controls" "controls" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.controls]

  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}