provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

module "web_app" {
  source = "./modules/web-app"

  project       = var.project
  environment   = var.environment
  instance_type = var.instance_type
  ami_id        = var.ami_id
  vpc_id        = var.vpc_id  
  subnet_id     = var.subnet_id

}
