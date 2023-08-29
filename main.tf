/* # Create EC2 Instance
resource "aws_instance" "ec2_examble" {
    ami           = "ami-051f7e7f6c2f40dc1"
    #count        =  2
    instance_type = var.instance_type
    #security_groups = [aws_security_group.TF_SG.name]
    tags = {
        Name = "Terraform EC2"
    }
  } */


/* resource "aws_instance" "ec2_examble" {
    ami           = "ami-051f7e7f6c2f40dc1"
    count        =  var.instance_count
    instance_type =  "t2.micro"
    #security_groups = [aws_security_group.TF_SG.name]
    tags = {
        Name = "Terraform EC2"
    }
  } */

  resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  "t2.micro"
   count = 1
   associate_public_ip_address = var.enable_public_ip

   tags = {
           Name = "Terraform EC2"
   }

}
