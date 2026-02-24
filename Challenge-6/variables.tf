variable "vpc_id" {
  description = "The VPC ID to deploy the EC2 instance in"
  type = string
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type = string
}

variable "instance_type" {
  description = "The EC2 instance type (e.g., t3.micro)"
  type = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type = string
}

variable "subnet_id" {
  description = "The Subnet ID to deploy the EC2 instance in"
  type = string
}

variable "instance_name" {
  description = "The EC2 instance name"
  type = string
}

variable "aws_region" {
  type        = string
}

variable "aws_profile" {
  type = string
}