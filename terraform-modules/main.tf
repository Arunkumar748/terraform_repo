#provider information
provider "aws" {
    region = "us-east-1"
}

module "demo-module-ec2" {   
  source       = "../modules-ec2"
  ami          = "ami-051f7e7f6c2f40dc1"
  
}



