output "public_ip" {
    description = "The public Ip of the instance"
    value       = aws_instance.web_server.public_ip
}

output "instance_id" {
    description = "EC2 instance Id"
    value       = aws_instance.web_server.id
}

output "key_name" {
    description = "The key name"
    value       = aws_key_pair.deployer.key_name
}