resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  var.instance_type
   
   tags = {
           Name = local.instance_name
   }

}

locals {
          instance_name  = "${terraform.workspace}-instance"
}