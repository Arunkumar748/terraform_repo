provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "terraform-file-provisioner" {
    ami   =  "ami-04cb4ca688797756f"
    instance_type  =  "t2.micro"
    key_name  = "filekey.pem"
    
    tags  =  {
              Name  = "terraform-file-provisioner   "
    }

provisioner "file" {
    source      = "file_copy"
    destination = "/tmp/file_copy"
}
connection {
    type        = "ssh"
    user        = "ec2-user" # The username for your EC2 instance (it may vary)
    private_key = file("filekey.pem") # Provide the path to your private key
    host        = aws_instance.terraform-file-provisioner.public_ip
  }
}