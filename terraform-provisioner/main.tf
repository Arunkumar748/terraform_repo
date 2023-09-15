provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "terraform-file-provisioner" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    #keyname  = ""
    
    tags  =  {
              Name  = "terraform-file-provisioner   "
    }
}

