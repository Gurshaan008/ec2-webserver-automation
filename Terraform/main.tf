resource "aws_key_pair" "deployer" {
    key_name    = "my-key"
    public_key  = file("ssh-key/id_rsa.pub")
}

resource "aws_security_group" "web_sg" {
    name        = "web_server_sg"
    description = "Allow SSH and HTTP"

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = 80
        to_port         = 80
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

resource "aws_instance" "web_server" {
    ami             = "ami-0e449927258d45bc4"       #Amazon linux 2 (for us east-1)
    instance_type   = var.instance_type 
    key_name        = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.web_sg.name]

    tags = {
        Name = "Terraform-Web-Server"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y"
        ]

        connection {
            type        = "ssh"
            user        = "ec2-user"
            private_key = file("${path.module}/../ssh-key/id_rsa")
            host        = self.public_ip
        }
    }
}