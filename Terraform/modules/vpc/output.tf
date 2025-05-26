output "vpc_id" {
    description = "The VPC ID is"
    value       = aws_vpc.main.id
}

output "public_subnet_ids" {
    description = "List of public subnet IDs"
    value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
    description = "List of Private subnet IDs"
    value       = [for subnet in aws_subnet.private : subnet.id]
}

output "nat_gateway_id" {
    description = "NAT gateway Id"
    value       = aws_nat_gateway.nat_gateway.id
}

output "public_route_table_id" {
    description = "Route table for the public subnets"
    value       = aws_route_table.public_rt.id
}

output "private_route_table_id" {
    description = "Route table for the private subnet"
    value       = aws_route_table.private_rt.id
}

output "default_sg_id" {
    description = "Default security group"
    value       = aws_security_group.vpc_sg.id
}