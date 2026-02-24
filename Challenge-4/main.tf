// Outputs and Data Sources

provider "aws" {
    region = "us-east-1"
    profile = "devops"
}

data "aws_vpc" "main" {
    id = "vpc-0372af8386725c7ed"
}

data "aws_subnet" "main" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.main.id]
    }
    filter {
        name   = "availability-zone"
        values = ["us-east-1a"]
    }
}

resource "aws_instance" "my_instance" {
    ami = "ami-0f3caa1cf4417e51b" // Amazon Linux
    instance_type = "t3.micro"

    subnet_id = data.aws_subnet.main.id

    vpc_security_group_ids = [aws_security_group.my_sg.id]

    tags = {
        Name = "tf-challenge-3"
    }
}

resource "aws_security_group" "my_sg" {
    name = "tf-challenge-3-sg"
    description = "Allow SSH and HTTP"

    vpc_id = data.aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "instance_id"{
    value = aws_instance.my_instance.id
}

output "instance_public_ip"{
    value = aws_instance.my_instance.public_ip
}

output "security_group_id"{
    value = aws_security_group.my_sg.id
}