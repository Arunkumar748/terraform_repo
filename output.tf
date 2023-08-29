output "my_EC2_Public_IP"{
    value = aws_instance.ec2_example.public_ip
}