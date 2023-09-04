provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

    ami = "ami-051f7e7f6c2f40dc1"
    instance_type = "t2.micro" 
    key_name= "key-for-terraform"
    vpc_security_group_ids = [aws_security_group.main.id]

}

resource "aws_security_group" "main" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "terraformkey.pem"
  public_key = "ssh-rsa AAAAB4NzaC1yc2EAAAADAQABAAABgQC3RDcVY3RnwQp7BnZhYEI70ZzG9uWHfyAKPPMUshlKOm5b4Xj7b06ZOnPiR6yFhgaycUZ8hYIRm6L4levrMs7PFFrJpb03uGR9YzN3STu38BpBgtDl91Z2nSPlw+W6JcnYtoalHnr/gbCDTSllGT0NVDJwSOesP6FXRO4Pq93kyLPqhKfZHThnzyfU8g2zuOISzwm1dweKfjcPY1zoRROhKlidav4nZ434oHftOQnY0W1IgunhUM0vzlMmYp+WER6hZwhqCVFcIpTRsQZ8/eN8RO79LveUirOpAww23s+UstE8P2gwB0kG9Xm0zXnxZIlEGBL8FtckEZSWGSFcxCboy74YZNvN5KzLjd+Yhzz4DNEb8jS9UM5pw86cxOj0aFu4e7GLBe6l0sJkE4YylYGigbyOAZckyplONHnC9+eMPzjp+NoZMnidWIy8R336uz0ul7+0/cZsnQ1962iCQ8ULeHUS8m+6G7gVgT6EEr7ULa7LMCgx1aJJ6+94wMpWw8s= root@ip-172-31-35-85.ec2.internal"
}