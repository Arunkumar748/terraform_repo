provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  "t2.micro"
   
   tags = {
           Name = "terraform_ec2import_statefile"
   }

}