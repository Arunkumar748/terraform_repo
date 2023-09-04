provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

    ami = "ami-051f7e7f6c2f40dc1 "  
    instance_type = "t2.micro" 
    key_name= "key-for-terraform"
    vpc_security_group_ids = [aws_security_group.main.id]

}

resource "aws_security_group" "main" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

resource "aws_key_pair" "deployer" {
  key_name   = "key-for-terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMJyVPqIUiBOtOBBI7hHsZB7uH9BuiygC5dUy5kRI4ujOBXQ1V7Pg/gfsRI41C+UbXkunU+SacuKaBp51vt/W3NxGpDncc4iOkIZt5sQOiJMANWuZ8/WnZduqv9MP4HZmompnDXnzCKJHC36BPyUUGlLJ/NpURzbLDtqqbFjKOys8+UEAtnnBhWT7x3urjvm8D96cSRSco56NOO/n0wH2Or3ddV9aSYOrrqhIhRewAyUY3ktiBMmRTVTvhBR/dqMNPQgQso4ARQikKnyiBQNXeBMtVxZVd/xdn2XcrlDAwMQ4flbBL7wLndPCIQtUcaRJb8vqcO6Hsl1eOQii+r6lb root@ip-172-31-35-85.ec2.internal"
}