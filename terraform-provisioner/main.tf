provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "terraform-file-provisioner" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    key_name  = "testkey"
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
    private_key = file("testkey")                                      #Provide the path to your private key
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
  key_name   = "testkey.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCv/op/pxeoFUN6s/JukR7GdDukwoU34vCZuE54u4Bbs3DSJAL+p2U1oeiLD3ujVQoCBTJNR+BameWEYi37d2Dn1++UQ+pQybaNmFF6mohPe/fcNsg6dHaVOox1To7tF/u5z8+6H07tbNGuXCnuq6rsSuxWuZ04e+O1XjhIk1OZCz+g1mUebl3nwPs4bYk+VrKqu+c9/o7cCCIwP6Y6JpdjYV+wQY2poBBzorRlMS4qbrgwKfTIhEt8F3TTAmcWk2LyucKLslqegodRYG3S7gQVZ2bRgWy/Dkf+FCCUiBjFtfl9q+Y74Qw0A93WrvoVk0wt7dtirrPXgK3OsDYqjJUdj8/qOA1I9m+FeOO64WaTVxvfrgMeMfBrTlhyKQSwdWeu7AhZLKcQzr4ImsmDgwSqtjkK/YyYfEIvbEveMO+U9Y1HzxgrfABMJfKZ/ImZr9EnjZNsTW+emTfb9r9ys1YckOt5dFG0O8gzA9Y54pAbszpp87Xmx6MFr/7MxEY0NEE= root@ip-172-31-35-85.ec2.internal"
}









#Creating key
#aws ec2 create-key-pair --key-name filekey --query 'KeyMaterial' --output text > filekey.pem
#ssh -i filekey.pem ec2-user@public.ip