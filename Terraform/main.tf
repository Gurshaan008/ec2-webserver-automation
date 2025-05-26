module "vpc" {
    source = "./modules/vpc"

    vpc_name             = var.vpc_name
    vpc_cidr_block       = var.vpc_cidr_block
    security_group       = var.security_group
    ssh_port             = var.ssh_port
    http_port            = var.http_port
    igw_name             = var.igw_name
    public_route         = var.public_route
    public_subnets       = var.public_subnets
    private_subnets      = var.private_subnets
    nat_gat              = var.nat_gat
    private_route        = var.private_route
}

module "ec2" {
    source = "./modules/ec2"

    key_name                = var.key_name
    public_key              = var.public_key 
    ami                     = var.ami
    instance_type           = var.instance_type
    subnet_id               = module.vpc.public_subnet_ids[0]
    security_group_ids      = [module.vpc.default_sg_id]
    private_key             = var.private_key
    webserver               = var.webserver
}