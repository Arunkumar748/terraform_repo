/* resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  var.instance_type
   count = 3
   tags = {
           Name = local.instance_name
   }

}

locals {
          instance_name  = "${terraform.workspace}-instance"
} */


#dev enivronment
#production environment

/* resource "aws_instance" "ec2_example" {

   ami           = "ami-051f7e7f6c2f40dc1"
   instance_type =  var.instance_type
   
   tags = {
           Name = import-dev-instance
   }

} */

/* data "aws_instance" "import-dev-instance" {
  instance_id = "i-0b647eee4da3d60f2"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = var.instance_type
  count = 3
  tags = {
    Name = data.aws_instance.import-dev-instance.tags.Name
  }
}
 */