# For the "dev" workspace
terraform {
  backend "s3" {
    bucket         = "statefile-bucket-31-08"
    key            = "terraform.tfstate.d/terraform.tfstate"
    region         = "us-east-1"  
    encrypt        = true         
    }
}
