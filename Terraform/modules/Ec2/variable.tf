variable "key_name" {
    description = "Key Name for the Instance"
    type        = string
}

variable "public_key" {
    description = "path to public key"
    type        = string
}

variable "ami" {
    description = "AMi ID of the instance"
    type        = string
}

variable "instance_type" {
    description = "default instance type"
    type        = string
}

variable "subnet_id" {
    description = "Public Subnet to host the instance"
    type        = string
}

variable "security_group_ids" {
    description = "Security group for the EC2"
    type        = list(string)
}

variable "webserver" {
    description = "Name of the instance"
    type        = string
}

variable "private_key" {
    description = "privat key content"
    type        = string
}