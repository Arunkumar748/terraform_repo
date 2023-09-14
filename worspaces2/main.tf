 resource "aws_instance" "ec2_example" {

   ami           = "ami-04cb4ca688797756f"
   instance_type =  var.instance_type
   #count = 3
   tags = {
           Name = local.instance_name
   }

}

locals {
          instance_name  = "${terraform.workspace}-instance"
}
terraform {
    backend "s3" {
    bucket = "myworkspace-s3bucket-workspacesss"
    key    = "workspaceBackup/terraform.tfstate"
    region =  "us-east-1"
}
}