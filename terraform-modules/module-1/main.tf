/* resource "aws_instance" "ec2_module" {

   ami           ="var.ami_id"
   instance_type =  var.web_instance_type
   
   tags = {
           Name = "terraform_lifecycle"
   }
}

resource "aws_security_group" "tf-modules-sg" {
  name        = "tf-modules-sg"
  description = "tf-modules-sg"
  

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [""]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
 */