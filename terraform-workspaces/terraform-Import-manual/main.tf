provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "import_ec2_instance" {


}




#ami-026ebd4cfe2c043b2

######################## terraform import command to import resource 
  
#terraform import <RESOURCE_TYPE>.<RESOURCE_NAME> <RESOURCE_ID> 

#terraform import aws_s3_bucket.my_bucket my-bucket-name 