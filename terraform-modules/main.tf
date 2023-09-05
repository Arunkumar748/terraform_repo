#provider information
provider "aws" {
    region = "us-east-1"
}

module "mydemo-webserver-1" {   #webserver
  source = ".//module-1"
}

module "mytest-webserver-2" {  #ecommerce application
  source = ".//module-2"
}

