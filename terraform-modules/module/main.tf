resource "aws_instance" "ec2-module-demo" {

   ami           = var.ami_id
   instance_type =  var.web_instance_type
   #vpc_security_group_ids = [aws_security_group.module-sg.id]

   tags = {
           Name = "ec2-module-demo"
   }
}


















/* resource "aws_security_group" "module-sg" {
  name        = "module-sg"
  description = "module-sg"
  
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
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }
}
 */
