variable "project" {
    type        = string
    description = "Project name"
}

variable "instance_type" {
    type        = string
    description = "EC2 instance type"
}

variable "ami_id" {
    type        = string
    description = "AMI ID for the instance"
}

variable "vpc_id" {
    type        = string
    description = "VPC ID"
}

variable "subnet_id" {
    type        = string
    description = "Subnet ID"
}

variable "aws_region" {
    type        = string
    description = "AWS region"
}

variable "aws_profile" {
    type        = string
    description = "AWS profile to use"
}