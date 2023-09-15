provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "terraform-file-provisioner" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    key_name  = "demokey"
    vpc_security_group_ids = [aws_security_group.main.id]
    tags  =  {
              Name  = "terraform-file-provisioner   "
    }

provisioner "file" {
    source      = "file2_copy" 
    destination = "/tmp/file2_copy" 
}
provisioner "file" {
    source      = "file1_copy" 
    destination = "/tmp/file1_copy" 
}
connection {
    type        = "ssh"
    user        = "ec2-user"                                               #The username for your EC2 instance (it may vary)
    private_key = file("demokey.pem")                                      #Provide the path to your private key
    host        = aws_instance.terraform-file-provisioner.public_ip
  }
}
resource "aws_security_group" "main" {
  ingress                = [
   {
    cidr_blocks      = [ "0.0.0.0/0", ]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }
  ]
  egress = [
    {
    cidr_blocks      = [ "0.0.0.0/0", ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
    }
  ]
}











#Creating key
#aws ec2 create-key-pair --key-name filekey --query 'KeyMaterial' --output text > filekey.pem