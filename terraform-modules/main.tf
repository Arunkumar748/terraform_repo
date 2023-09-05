#provider information
provider "aws" {
    region = "us-east-1"
}

module "mydemo-webserver-1" {
  source = "./mydemo-webserver-1"
}

module "mytest-webserver-2" {
  source = ".mytest-webserver-2"
}

