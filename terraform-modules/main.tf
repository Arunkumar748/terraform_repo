#provider information
provider "aws" {
    region = "us-east-1"
}

module "my-demo-webserver-1" {
  source = "./terraform-modules\module-1"
}

module "my-test-webserver-2" {
  source = "./terraform-modules\module-2"
}

