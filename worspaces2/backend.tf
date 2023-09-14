# For the "dev" workspace
terraform {
  backend "s3" {
    bucket         = "statefile-bucket-31-08"
    key            = "terraform.tfstate.d/dev/terraform.tfstate"
    region         = "us-east-1"  
    encrypt        = true         
    }
}
# For the "test" workspace
terraform {
  backend "s3" {
    bucket         = "statefile-bucket-31-08"
    key            = "terraform.tfstate.d/test/terraform.tfstate"
    region         = "us-east-1"  
    encrypt        = true         
}
}