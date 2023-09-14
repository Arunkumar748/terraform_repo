terraform {
  backend "s3" {
    bucket         = "s3bucket-demostatefile"
    key            = "terraform.tfstate.d/my-environment/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}