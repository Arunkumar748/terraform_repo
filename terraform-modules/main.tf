#provider information
provider "aws" {
    region = "us-east-1"
}

module "mydemo-webserver-1" {
  source = ".//module-1"
}

module "mytest-webserver-2" {
  source = ".//module-2"
}

