output "public_ip" {
    description = "Public ip of the web server"
    value       = module.ec2.public_ip
}