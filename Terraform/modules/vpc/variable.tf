variable "vpc_cidr_block" {
    description = "CIDR block for the VPC"
    type        = string
}

variable "vpc_name" {
    description = "The name of the VPC"
    type        = string
}

variable "security_group" {
    description = "VPC security group"
    type        = string
}

variable "ssh_port" {
    description = "Port for SSH"
    type        = string
}

variable "http_port" {
    description = "Port for HTTP"
    type        = string
}

variable "igw_name" {
    description = "The name of the internet Gateway"
    type        = string
}

variable "public_route" {
    description = "Name of the public route table"
    type        = string
}

variable "public_subnets" {
    type = map(object({
        cidr_block = string
        az         = string
    }))
}

variable "private_subnets" {
    type = map(object({
        cidr_block = string
        az         = string
    }))
}

variable "nat_gat" {
    description = "Name of Nat gateway"
    type        = string
}

variable "private_route" {
    description = "Name of the private route table"
    type        = string
}
