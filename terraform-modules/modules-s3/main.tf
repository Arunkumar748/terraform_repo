resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }
}

resource "aws_iam_user" "example" {
  name = var.iam_user_name
}

resource "aws_iam_policy" "s3_readonly_policy" {
  name        = "s3-read-only-policy"
  description = "Policy for read-only access to S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:Get*",
        Effect   = "Allow",
        Resource = aws_s3_bucket.example.arn
      },
      {
        Action   = "s3:List*",
        Effect   = "Allow",
        Resource = aws_s3_bucket.example.arn
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "s3_readonly_attachment" {
  user       = aws_iam_user.example.name
  policy_arn = aws_iam_policy.s3_readonly_policy.arn
}
