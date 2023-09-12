#provider information
provider "aws" {
    region = "us-east-1"
}

module "demo-module-ec2" {   
  source       = ".//modules-ec2"
  ami_id       = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
}
module "my_iam_user" {
  source     =  ".//modules-iam"                                 
  username   =  "user1"                                          
  policy_arn =  "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  instance_id = "aws_instance.demo-module-ec2.id"
}
module "s3_bucket" {
  source       = ".//modules-s3"
  bucket_name  = "my-terraform-bucket-s3-user1"
  iam_user_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  iam_user_name = "user1"  # Pass a value for iam_user_name
}





