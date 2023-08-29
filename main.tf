# Create EC2 Instance
resource "aws_instance" "ec2_examble" {
    ami           = "ami-051f7e7f6c2f40dc1"
    #count         =  2
    instance_type = "var.instance_type"
    #security_groups = [aws_security_group.TF_SG.name]
    tags = {
        Name = "Terraform EC2"
    }
  }
