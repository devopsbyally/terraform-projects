data "aws_iam_policy_document" "allow_public_access" {
  statement {
    effect    = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]  # "*" means everyone (public)
    }

    actions = [
      "s3:GetObject",  # Allow public read access to objects
    ]

    resources = [
      "${aws_s3_bucket.s3-bucket.arn}/*",  # Apply to all objects in the bucket
    ]
  }
}
