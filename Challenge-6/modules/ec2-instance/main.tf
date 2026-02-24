resource "aws_instance" "my_instance" {
    ami = var.ami_id
    instance_type = var.instance_type

    subnet_id = var.subnet_id

    vpc_security_group_ids = [aws_security_group.my_sg.id]

    tags = {
        Name = var.instance_name
    }
}

locals {
  name_prefix = "devops-${var.environment}-${var.instance_name}"
}

resource "aws_security_group" "my_sg" {
    name = "${local.name_prefix}-sg"
    description = "Allow SSH and HTTP"

    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

