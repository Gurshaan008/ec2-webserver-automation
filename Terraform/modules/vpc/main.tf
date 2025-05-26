resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = var.vpc_name
    }
}

resource "aws_security_group" "vpc_sg"{
    name        = var.security_group
    description = "Allow SSH and HTTP"
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port       = var.ssh_port
        to_port         = var.ssh_port
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = var.http_port
        to_port         = var.http_port
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = var.igw_name
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id    = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = var.public_route
    }
}

resource "aws_subnet" "public" {
    for_each = var.public_subnets

    vpc_id            = aws_vpc.main.id
    cidr_block        = each.value.cidr_block
    availability_zone = each.value.az

    tags = {
        Name = each.key
    }
}

resource "aws_subnet" "private" {
    for_each = var.private_subnets

    vpc_id            = aws_vpc.main.id
    cidr_block        = each.value.cidr_block
    availability_zone = each.value.az
}

resource "aws_route_table_association" "public"{
    for_each          = aws_subnet.public

    subnet_id         = each.value.id
    route_table_id    = aws_route_table.public_rt.id
}

resource "aws_eip" "nat" {
    vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.nat.id
    subnet_id     = values(aws_subnet.public)[0].id

    tags = {
        Name = var.nat_gat
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.main.id 

    tags = {
        Name = var.private_route
    }
}

resource "aws_route" "private_route" {
    route_table_id          = aws_route_table.private_rt.id
    destination_cidr_block  = "0.0.0.0/0"
    nat_gateway_id          = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "private_association" {
    for_each        = aws_subnet.private

    subnet_id       = each.value.id
    route_table_id  = aws_route_table.private_rt.id
}