// EC2 instance with Terraform

provider "aws" {
    region = "us-east-1"
    profile = "devops"
}

resource "aws_instance" "my_instance" {
    ami = "ami-0f3caa1cf4417e51b" // Amazon Linux
    instance_type = "t3.micro"

    subnet_id = "subnet-0b9701f37f6f03174"

    vpc_security_group_ids = [aws_security_group.my_sg.id]

    tags = {
        Name = "tf-challenge-3"
    }
}

resource "aws_security_group" "my_sg" {
    name = "tf-challenge-3-sg"
    description = "Allow SSH and HTTP"

    vpc_id = "vpc-0372af8386725c7ed"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}