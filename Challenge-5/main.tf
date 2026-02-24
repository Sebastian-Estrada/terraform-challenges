// Outputs and Data Sources

provider "aws" {
    region = var.aws_region
    profile = var.aws_profile
}

data "aws_vpc" "main" {
    id = var.vpc_id
}

locals {
  name_prefix = "devops-${var.environment}"
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
    ami = var.ami_id
    instance_type = var.instance_type

    subnet_id = data.aws_subnet.main.id

    vpc_security_group_ids = [aws_security_group.my_sg.id]

    tags = {
        Name = local.name_prefix
    }
}

resource "aws_security_group" "my_sg" {
    name = local.name_prefix
    description = "Allow SSH and HTTP"

    vpc_id = data.aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

