# output of the bucket name
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.s3-bucket.bucket
}

# output of the object URL
output "object_url" {
  description = "The URL of the uploaded object"
  value = "https://${aws_s3_bucket.s3-bucket.bucket}.s3.amazonaws.com/${var.object_key}"
}