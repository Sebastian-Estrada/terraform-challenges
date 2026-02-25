output "instance_id" {
    description = "The ID of the EC2 instance"
    value       = aws_instance.web_app.id
}

output "public_ip" {
    description = "The public IP address of the EC2 instance"
    value       = aws_instance.web_app.public_ip
}

output "security_group_id" {
    description = "The ID of the security group"
    value       = aws_security_group.web_app_sg.id
}

output "bucket_name" {
    description = "The name of the S3 bucket"
    value       = aws_s3_bucket.web_app_bucket.bucket
}