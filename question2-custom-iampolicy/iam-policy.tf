resource "aws_iam_policy" "s3-read-write-policy" {
  name = "s3-accesspolicy-ec2"
  description = "Policy to allow read and write access to tf-s3bucket-11.11"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}", 
          "arn:aws:s3:::${var.bucket_name}/*"  
        ]
      }
    ]
  })
}
