terraform {
  backend "s3" {
    bucket         = "mystatefile-buket-environments"
    key            = "terraform.tfstate.d/my-environment/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}