provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "import-ec2-manual" {
    ami   =  "ami-005b11f8b84489615"
    instance_type  =  "t2.micro"
    
    tags  =  {
              Name  = "import-ec2-manual"
    }

}




#ami-005b11f8b84489615

######################## terraform import command to import resource 
  
#terraform import <RESOURCE_TYPE>.<RESOURCE_NAME> <RESOURCE_ID> 
#terraform import aws_instance.import-ec2-manual i-0e5731608f6d187c7

#terraform import aws_s3_bucket.my_bucket my-bucket-name 