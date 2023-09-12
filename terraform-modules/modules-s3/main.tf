resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"  
  acl    = "private"  
}
resource "aws_iam_policy" "s3_read_policy" {
  name        = "s3-read-policy"
  description = "Read-only policy for S3 bucket"

  /* # Define the policy document that grants read-only access to the S3 bucket
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:GetObject",
        Effect   = "Allow",
        Resource = aws_s3_bucket.my_bucket.arn
      }
    ]
  })
} */

resource "aws_iam_user" "user1" {
  name = var.iam_user_name
}
}