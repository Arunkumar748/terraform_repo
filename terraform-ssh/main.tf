provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

    ami = "ami-04cb4ca688797756f"
    instance_type = "t2.micro" 
    key_name= "key-for-demo-1.pub"
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
  key_name   = "key-for-demo-1.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY9hGqUVkKouOodmjId5quHexyjNWR1DYmtqG/X612BMSW2YZP1Pbca0hX7eYKq9X5SzGzcCBouFAuTH9cRY/+ewWVx7BJUbuU/PJj9sJORj2DiFyCNy0nf1ALA4vWhVOlm8ciXCTBMrG0MepgOZ3UVfWDelhbpWm+ah39sybPS1v4JNL97LONH4jG0Nkx9fARcoBYezB6/JmXuwpYDnAlaJJ5NGZYAwUUxZ0sv4SSUFBfuqKrxCPKxFM5kKanDPrhMhi/Xl5kWbM8I06ZIEQ/71zdhtsu8aDNuqAzYJKcDZYc1eXzUK2FaRVLtPhiZtkf1tI4/OKh76fIs2yRxzXvSs4tmi87KoO+Wg04b3Lotg7NcfGTs2L9e/DauOnSyYiWrmCVjriFT8fkdIREy9UvJNF2R/T9vq90RF+U0Ou3Aizunyyi9wfn6R6QCiR9hUtofhszRFQI7h0IyxLMIoI6vsz4Rf0g59a/wpgtXxLUOr60imbQuYsw9Z3L2MoIMxM= root@ip-172-31-35-85.ec2.internal"
  }