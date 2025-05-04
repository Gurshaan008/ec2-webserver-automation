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

variable "public_key_path" {
    description = "Path to the public key"
    type        = string            
}

variable "vpc_security_group_ids" {
    description = "List of the security group IDs"
    type        = list(string)
    default     = []
}