/* provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-04cb4ca688797756f"
   instance_type =  "t2.micro"
   
   tags = {
           Name = "terraform_ec2import_statefile"
   }

}


terraform {
    backend "s3" {
    bucket = "myremote-statefile-bucket"
    key    = "key/terraform.tfstate"
    region =  "us-east-1"
}
} */
