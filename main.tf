
terraform {
  cloud {
    organization = "Thrinkshive"

    workspaces {
      name = "crc-frontend"
    }
  }
}



resource "aws_s3_bucket" "website" {
  bucket        = "www.${var.bucket_name}"
  force_destroy = true
  tags          = local.tags

}

resource "aws_s3_bucket_server_side_encryption_configuration" "www_encrypt" {
  bucket = aws_s3_bucket.website.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "www_s3block" {
  bucket                  = aws_s3_bucket.website.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "www_bucket_acl" {
  bucket = aws_s3_bucket.website.id
  acl    = "private"
}




# S3 bucket for redirecting non-www to www.
resource "aws_s3_bucket" "root_bucket" {
  bucket = var.bucket_name

  website {
    redirect_all_requests_to = "https://www.${var.domain_name}"
  }

  tags = local.tags
}

resource "aws_s3_bucket_public_access_block" "root_s3block" {
  bucket                  = aws_s3_bucket.root_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.root_bucket.id
  acl    = "private"
}



resource "aws_s3_bucket_policy" "s3policy" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.s3policy.json
}


