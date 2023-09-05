#provider information
provider "aws" {
    region = "us-east-1"
}

module "mydemo-webserver-1" {
  source = "./path/to/mydemo-webserver-1"
}

module "mytest-webserver-2" {
  source = "./path/to/mytest-webserver-2"
}

