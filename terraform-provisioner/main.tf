####################################################
#File provisioner
####################################################

/* provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "terraform-file-provisioner" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    key_name  = "abcd_key"
    vpc_security_group_ids = [aws_security_group.main.id]
    tags  =  {
              Name  = "terraform-file-provisioner   "
    }

provisioner "file" {
    source      = "testfile" 
    destination = "/tmp/testfile" 
}
connection {
    type        = "ssh"
    user        = "ec2-user"                                               #The username for your EC2 instance (it may vary)
    private_key = file("abcd_key")                                      #Provide the path to your private key
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
resource "aws_key_pair" "deployer" {
  key_name   = "abc_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuDYGx8u/gvfVnd6Toe6EMnTF8w83IlqF+ZRIiEKJs1UWRVmH/1v6919vpareDXkNEzarNVXDZGifHQOP2MaG2gKOMy8YJ3+/pV5la0+3c/4prA7oGWwOqWZIbwO0AMRhC8eEY49AmuRdfw6gLS0nlVoCE37uxjlL7k7oMsdQsIwpPIu0lYvr6+GzyjEUkQLDy048vw9xEeIZFCBL8d9Plk715E2uYN4hmflJLapDAmDrlpqXsLM3A8Yi9V/Aa98wv4vB0aHPIn5gSLdvjC1hajzWazGOd2By6uVxo3P2jtMb1/xdcfKxWKR4g/i506p1I2yPLi0rc6VXFtLZAloC7 root@ip-172-31-35-85.ec2.internal"
} */









#Create single key
#aws ec2 create-key-pair --key-name filekey --query 'KeyMaterial' --output text > filekey.pem
#ssh -i filekey.pem ec2-user@public.ip

#create multiple key
#ssh-keygen -t rsa -b 2048 




##########################################
#Local.exec
#########################################

provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "terraform-file-provisioner" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    tags  =  {
              Name  = "terraform-local-provisioner   "
    }

provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ip.txt"      #echo The server's IP address
  }
}


