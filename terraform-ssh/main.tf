provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2_example" {

    ami = "ami-04cb4ca688797756f"
    instance_type = "t2.micro" 
    key_name= "key-for-demo-2.pub"
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
  key_name   = "key-for-demo-2.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIbJnh2hPjeNJNMCVngNSWGb1PCDznnQnFsVJMyxJDRFBsbrie6WBVQPxqOiOLI1ndWYAP1RSTKec63HDniJmv9QQnqoA33eswKfQftyByHf5lweE6CPQbF9Mm1Wa0vcOknNchdhzDystZGE+DLIWQVGl0qrGUMna9qLNpcaNq1TRxtPXbEQ07RgetLD/MHI/+4UNAjmqpCf2tp78S1qgcD0q3mSFgH5053ZDTeZhu5lC8pMdXdrwuW0zEJuefbE1XBeVwhNNB+gXHSQNpWPMTFle6HhhQilnAKXL9tr6S/mGA0vz6wJLwfBL1QyEXpUDtvTZwmlFZ2lvhG7dxLvgf+BvgbV6HCBezIeVUhzMJZ3/X3qFcwW7m8d0fVJnTOGDbF+pds1Kmb8WYVenvRtb74cTuyHSVO4jv9NhOgwdeoDOqAEiyPpiqz35AdMvAepNPCShq3MmGf1E4oq81T9MeVPt5moPB2gw3qaf0si0fQkkAXwSdLC75R35sMVOHRHU= root@ip-172-31-35-85.ec2.internal"
}