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

 /*  resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  "t2.micro"
   count = 1
   #associate_public_ip_address = var.enable_public_ip

   tags = {
           Name = "Terraform EC2"
   }

}

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}
 */

/*  resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  "t2.micro"

   tags = var.project_environment

} */

##############################################  Terraform Locals
/* locals {
    staging_env  = "staging"
}

# Creating VPC with the default values
resource "aws_vpc" "staging-vpc" {
    cidr_block                       = "10.0.0.0/16"   
    instance_tenancy                 = "default"
    enable_dns_hostnames             = true
    assign_generated_ipv6_cidr_block = false
    tags  = {
        Name  = "${local.staging_env}-staging-vpc-tag"
    }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id = aws_vpc.staging-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "${local.staging_env}-subnet-tag"
  }
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  "t2.micro"
   subnet_id     =  aws_subnet.staging-subnet.id

   tags = {
    Name  =  "${local.staging_env}-Terraform EC2"
 
}
} */

##########################################  Output values
resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  "t2.micro"
   
   tags = {
           Name = "Terraform EC2"
   }

}
