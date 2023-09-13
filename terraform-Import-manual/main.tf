/* provider "aws" {
    region = "us-east-1"
}   
resource "aws_instance" "import-ec2" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    
    tags  =  {
              Name  = "import-ec2"
    }

}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-importss3-bucket"  
  versioning {
    enabled = true
  }
} */












######################## terraform import command to import resource 
  
#terraform import <RESOURCE_TYPE>.<RESOURCE_NAME> <RESOURCE_ID> 
#terraform import aws_instance.import-ec2-manual i-0e5731608f6d187c7


#terraform import aws_instance.import-ec2 i-0e5731608f6d187c7
#terraform import aws_instance.importec2 i-0e5731608f6d187c7
#terraform import aws_s3_bucket.my_bucket my-bucket-name 


#ami-026ebd4cfe2c043b2
#i-0e3ad1f66994a3859


 