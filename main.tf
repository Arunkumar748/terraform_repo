# Create EC2 Instance
resource "aws_instance" "abcdef-public_instance" {
    ami           = "ami-051f7e7f6c2f40dc1" 
    instance_type = "t2.micro"
    
    tags = {
        Name = "Instance-public"
    }
    
}