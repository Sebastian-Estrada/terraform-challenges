provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

module "web_server" {
  source = "./modules/ec2-instance"
  instance_name = "my-web-server"
  vpc_id = var.vpc_id
  instance_type = var.instance_type
  ami_id = var.ami_id
  subnet_id = var.subnet_id
  environment = var.environment
}

module "api_server" {
  source = "./modules/ec2-instance"
  instance_name = "my-api-server"
  vpc_id = var.vpc_id
  instance_type = var.instance_type
  ami_id = var.ami_id
  subnet_id = var.subnet_id
  environment = var.environment
}