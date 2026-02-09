#### VPC  ###

resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block

    tags = {
      Name = "intern-vpc"
    }
}

######## SUBNETS

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.public_cidr_block
    map_public_ip_on_launch = true

    tags = {
      Name="public-subnet"
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.private_cidr_block

    tags = {
      Name="private-subnet"
    }
}

## internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name="intern-igw"
    }
}

##### ROute table  ##
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "public-route-table"
    }
}

resource "aws_route_table_association" "public_assoc" {
    route_table_id = aws_route_table.public_rt.id
    subnet_id = aws_subnet.public.id

}

##### security groups ###

resource "aws_security_group" "ec2_sg" {
    name = "ec2-security-group"
    vpc_id = aws_vpc.my_vpc.id

    ## inbound rules
    # ssh
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #application access
    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ## outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name="ec2-sg"
    }
}

### EC2 instance ####
resource "aws_instance" "app_server" {
    ami = "ami-01fd6fa49060e89a6"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public.id
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    ##### docker installation using user_data

    user_data = <<EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
    EOF

    tags = {
      Name="nodejs-docker-server"
    }
}


