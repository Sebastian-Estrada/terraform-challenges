locals {
  name_prefix = "${var.project}-${var.environment}"
}

resource "aws_instance" "web_app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.web_app_sg.id ]
  subnet_id     = var.subnet_id

  tags = {
    Name = "${local.name_prefix}-web-app"
  }
}

resource "aws_security_group" "web_app_sg" {
  name        = "${local.name_prefix}-web-app-sg"
  description = "Security group for web application"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_s3_bucket" "web_app_bucket" {
  bucket = "${local.name_prefix}-assets"

  tags = {
    Name = "${local.name_prefix}-web-app"
  }
}