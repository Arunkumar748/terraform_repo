provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

    ami = "ami-051f7e7f6c2f40dc1"
    instance_type = "t2.micro" 
    key_name= "demokey.pub"
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

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "demokey.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCo4PcrzRPYSuHsX7AfWAtHk2wSS9NClUeLr/5EQXcL05DvOn+EXDGpQvVd1uPDwZrmVCHQR7zFuBssC0dEtoWFBFt6Ipdpwfw3njPe7++AkIUlVT8p8ePaEcF/uhJAkYOq5QgezCrlG7K3H/RD9zVcxv1TfE66D0Nu6Z8M+qDUvCU5RxrBwQ3FX0Vp101urBJgggV6v8kgYxm8Vu7zmEXtZIGspVqvQCtxrbqZ+I57H75K75Dr/MLNd+mFIvEEnd4Lzp18p8lJqsEfHmQQThXC3mIoPx6+DV3Dbl5biYCbKDkHzZaEcLOxZfT7UL+mTz46LOW4OiM1U6q90slnKjgB root@ip-172-31-35-85.ec2.internal"
  }