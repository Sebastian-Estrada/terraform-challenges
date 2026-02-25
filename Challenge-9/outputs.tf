output "instance_id" {
    description = "The ID of the EC2 instance"
    value       = module.web_app.instance_id
}

output "public_ip" {
    description = "The public IP address of the EC2 instance"
    value       = module.web_app.public_ip
}

output "security_group_id" {
    description = "The ID of the security group"
    value       = module.web_app.security_group_id
}

output "bucket_name" {
    description = "The name of the S3 bucket"
    value       = module.web_app.bucket_name
}