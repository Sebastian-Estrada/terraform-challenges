terraform {
  backend "s3" {
    bucket = "devops-tf-state-sen-2026"
    key = "challenge-10/terraform.tfstate"
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

# Part A - Challenge 10: Create an S3 bucket with lifecycle rules to prevent deletion
# resource "aws_s3_bucket" "protected" {
#   bucket = "devops-lab-protected-sen-2026"

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# Part B - Challenge 10: Import an existing S3 bucket into Terraform state

resource "aws_s3_bucket" "imported" {
  bucket = "devops-lab-imported-sen-2026"
}