provider "aws"{
    region = "us-east-1"
    profile = "devops"
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "devops-student-tf-sen-2026"

    tags = {
        Environment = "dev"
    }
}

resource "aws_s3_object" "my_object" {
    bucket = aws_s3_bucket.my_bucket.id
    key = "hello.txt"
    content = "Updated by Terraform!"
}
