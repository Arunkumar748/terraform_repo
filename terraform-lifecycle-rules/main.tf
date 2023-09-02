provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  "t2.micro"
   
   tags = {
           Name = "terraform_lifecycle"
   }
}

resource "aws_eip" "myeip" {
    instance = aws_instance.ec2_example.id
}

resource "aws_eip_association" "eip_assoc" {
    instance_id  =  aws_instance.ec2_example.id
    allocation_id = aws_eip.myeip.id
}

resource "aws_security_group" "allow_eip" {
  name        = "lifecycle-sg"
  description = "lifecycle-sg"
  

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["aws_eip.myeip.public_ip/32"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
}