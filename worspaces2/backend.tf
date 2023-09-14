terraform {
  backend "s3" {
    bucket         = "statefile-bucket-3"
    key            = "terraform.tfstate.d/${terraform.workspace}"
    region         = "us-east-1"
    encrypt        = true
  }
}
