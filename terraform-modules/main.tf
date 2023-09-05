#provider information
provider "aws" {
    region = "us-east-1"
}

module "mydemo-webserver-1" {
  source = "terraform-modules\main.tf"
}

module "mytest-webserver-2" {
  source = "terraform-modules\main.tf"
}

