resource "aws_key_pair" "deployer" {
    key_name    = var.key_name
    public_key  = file(var.public_key)
}

resource "aws_instance" "web_server" {
    ami                     = var.ami
    instance_type           = var.instance_type
    key_name                = aws_key_pair.deployer.key_name
    subnet_id               = var.subnet_id
    vpc_security_group_ids  = var.security_group_ids
    associate_public_ip_address = true

    tags = {
        Name = var.webserver
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y"
        ]

        connection {
            type        = "ssh"
            user        = "ec2-user"
            private_key = file(var.private_key)
            host        = self.public_ip
        }
    }  
}