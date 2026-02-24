provider "aws" {
    region = "us-east-1"
    profile = "devops"
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "devops-student-tf-sen-2026"
}