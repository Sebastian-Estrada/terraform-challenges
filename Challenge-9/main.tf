terraform {
  backend "s3" {
    bucket = "devops-tf-state-sen-2026"
    key = "challenge-9/terraform.tfstate"
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
  instance_type = var.instance_type
  ami_id        = var.ami_id
  vpc_id        = var.vpc_id  
  subnet_id     = var.subnet_id
  environment = terraform.workspace

}
