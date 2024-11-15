# STEP-1: create s3 bucket
resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket_name
  tags   = var.bucket_tags
}

resource "aws_s3_bucket_public_access_block" "s3-bucket-public-access-block" {
  bucket = aws_s3_bucket.s3-bucket.id

  block_public_acls       = false  # Allow public ACLs
  block_public_policy     = false  # Allow public policies
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# STEP-2: add private acl
resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  bucket = aws_s3_bucket.s3-bucket.bucket
  acl    = var.bucket_pri_acl
}

# STEP-3: enable versioning on s3 bucket
resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = var.versioning
  }
}

# STEP-4: upload an object to s3 bucket
resource "aws_s3_object" "my-first-object" {
  bucket = aws_s3_bucket.s3-bucket.bucket 
  key    = var.object_key  #destination to s3 bucket
  source = var.object_source  #source from local
  acl = var.object_pub_acl
}

# STEP-5: attch policy, make the bucket objects public
resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.s3-bucket.id  
  policy = data.aws_iam_policy_document.allow_public_access.json
}