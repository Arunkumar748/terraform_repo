terraform {
  backend "s3" {
    bucket         = "my-environment"
    key            = "terraform.tfstate.d/my-environment/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

