terraform {
  backend "s3" {
    bucket = "devops-tf-state-sen-2026"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
    profile = "devops"
  }
}

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
