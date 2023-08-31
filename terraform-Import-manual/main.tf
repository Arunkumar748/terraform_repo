provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "import-ec2-manual" {
    ami   =  "i-007fd1b924c64b503"
    instance_type  =  "t2.micro"
    
    tags  =  {
              Name  = "import-ec2-manual"
    }

}




#ami-026ebd4cfe2c043b2

######################## terraform import command to import resource 
  
#terraform import <RESOURCE_TYPE>.<RESOURCE_NAME> <RESOURCE_ID> 
#terraform import aws_instance.import-ec2-manual i-007fd1b924c64b503

#terraform import aws_s3_bucket.my_bucket my-bucket-name 