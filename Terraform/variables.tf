variable "aws_region" {
    description = "The AWS region to deploy the resource"
    type        = string
    default     = "us-east-1"
}

variable "instance_type" {
    description = "EC2 Instance Type"
    type        = string
    default     = "t2.micro"
}

variable "vpc_security_group_ids" {
    description = "List of the security group IDs"
    type        = list(string)
    default     = []
}

variable "private_key" {
    description = "Privat key content"
    type        = string
}