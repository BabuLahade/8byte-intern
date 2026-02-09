output "public" {
  value = aws_subnet.public.id
}

output "my_vpc" {
  value = aws_vpc.my_vpc.id
}

output "igw" {
  value = aws_internet_gateway.igw.id
  
}
output "ec2_public_ip" {
    value = aws_instance.app_server.public_ip
}