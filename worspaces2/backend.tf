terraform {
  backend "s3" {
    bucket         = "statefile-bucket-3"
    key            = "terraform.tfstate.d/${var.workspace}"
    region         = "us-east-1"
    encrypt        = true
  }
}
