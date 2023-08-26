# Creating VPC with the IGW
resource "aws_vpc" "vpc" {
    cidr_block                       = "10.0.0.0/16"   
    instance_tenancy                 = "default"
    enable_dns_hostnames             = true
    assign_generated_ipv6_cidr_block = false
    tags  = {
        Name  = "TerraformVPC"
    }
}

resource "aws_internet_gateway" "internet_gateway" {
vpc_id    =  aws_vpc.vpc.id

tags = {
    Name = "TerraformIGW"
} 
}

# Create EC2 Instance
resource "aws_instance" "abcdef-public_instance" {
    ami           = "ami-051f7e7f6c2f40dc1"
    count         =  4
    instance_type = "t2.micro"
    
    tags = {
        Name = "Instance-public_${count.index}"
    }
    
}

# Creating Security group 
resource "aws_security_group" "TF_SG" {
  name        = "Terraform using security group"
  description = "Terraform using security group"
  

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
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

# Creating S3 bucket
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "my-terraform-testdemo-privatebucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name  = "Mys3bucketprivateTF"
    
  }
}