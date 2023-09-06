#provider information
provider "aws" {
    region = "us-east-1"
}

module "ec2-module-demo" {   
  source       = ".//modules"
  ami          = "ami-051f7e7f6c2f40dc1"
}



