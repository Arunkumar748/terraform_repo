provider "aws" {
    region = "us-east-1"
}   
resource "aws_instance" "import-ec2" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    
    tags  =  {
              Name  = "import-ec2"
    }

}
resource "aws_s3_bucket" "s3-importbucket" {
  bucket = "s3-importbucket"  
  versioning {
    enabled = true
  }
}