terraform {
  required_version = ">=1.0.6"
}

resource "aws_instance" "ec2_module_1" {

   ami           = var.ami_id
   instance_type =  var.web_instance_type
   keyname       = "demokey.pub"                #This is optional one 
   vpc_security_group_ids = [aws_security_group.tf-modules-sg]

   tags = {
           Name = "terraform_lifecycle"
   }

  user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module-1 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF
}


resource "aws_security_group" "tf-modules-sg" {
  name        = "tf-modules-sg"
  description = "tf-modules-sg"
  

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [""]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "demokey.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCo4PcrzRPYSuHsX7AfWAtHk2wSS9NClUeLr/5EQXcL05DvOn+EXDGpQvVd1uPDwZrmVCHQR7zFuBssC0dEtoWFBFt6Ipdpwfw3njPe7++AkIUlVT8p8ePaEcF/uhJAkYOq5QgezCrlG7K3H/RD9zVcxv1TfE66D0Nu6Z8M+qDUvCU5RxrBwQ3FX0Vp101urBJgggV6v8kgYxm8Vu7zmEXtZIGspVqvQCtxrbqZ+I57H75K75Dr/MLNd+mFIvEEnd4Lzp18p8lJqsEfHmQQThXC3mIoPx6+DV3Dbl5biYCbKDkHzZaEcLOxZfT7UL+mTz46LOW4OiM1U6q90slnKjgB root@ip-172-31-35-85.ec2.internal"
  } 