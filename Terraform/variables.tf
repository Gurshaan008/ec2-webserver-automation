 variable "vpc_cidr_block" {
    default = "10.0.0.0/16" 
}

variable "vpc_name" {
    default = "main-vpc"
}

variable "security_group" {
    default = "My-SG"
}

variable "ssh_port" {
    default = "22"
}

variable "http_port" {
    default = "80"
}

variable "igw_name" {
    default = "my-IGW"
}

variable "public_route" {
    default = "Public-route-table"
}

variable "public_subnets" {
    type = map(object({
        cidr_block = string
        az         = string
    }))
    
    default = {
        public_subnet_1 = {
            cidr_block = "10.0.1.0/24"
            az         = "us-east-1a"
        }

        public_subnet_2 = {
            cidr_block = "10.0.2.0/24"
            az         = "us-east-1b"
        }
    }
}

variable "private_subnets" {
    type = map(object({
        cidr_block  = string
        az          = string
    }))

    default = {
        private_subnet_1 = {
            cidr_block = "10.0.3.0/24"
            az         = "us-east-1a"
        }

        private_subnet_2 = {
            cidr_block = "10.0.4.0/24"
            az         = "us-east-1b"
        }
    }
}

variable "nat_gat" {
    default = "My-Nat-Gateway"
}

variable "private_route" {
    default = "Private-route-table"
}

variable "key_name" {
    default = "my-key"
}

variable "public_key" {
    default = "my-key/id_rsa.pub"
}

variable "ami"{
    default = "ami-0e449927258d45bc4"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "webserver" {
    default = "My-Terraform-webserver"
}

variable "private_key" {
    default = "my-key/id_rsa"
}