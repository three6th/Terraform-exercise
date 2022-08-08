terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.5.0"
      }
    }
}

provider "aws" {
    region = var.aws_region
    shared_credentials_file = "~/.aws/credentials"
    profile = "default"
}

resource "aws_secuurity_group" "http_server" {
    name = "http-server"
    vpc_id = aws_default_vpc.default.vpc_id
    ingress {
        from_port = var.list_of_ports[0]
        to_port = var.list_of_ports[0]
        protocol = "tcp"
    }
    ingress {
        from_port = var.list_of_ports[1]
        to_port = var.list_of_ports[1]
        protocol = "tcp"
    }
}

resource "aws_instance" "test-instance" {
    name = "test-instance"

    count = var.number_of_vms
    ami = "ami-0c956e207f9d113d5"
    instance_type = var.size_of_vms
    key_name = aws_key_pair.sshkey.key_name
    vpc_security_group_ids = ["aws_security_group.http_server.id"]

    provisioner "file" {
        source = "~/variables.yml"
        destination = "~/variables.yml"

        connection {
            type = "ssh"
            user = "ubuntu"
            private_key = file("~/.aws/test.pem")
        }
    }

    provisioner "file" {
        source = "~/test-playbook.yml"
        destination = "~/test-playbook.yml"

        connection {
            type = "ssh"
            user = "ubuntu"
            private_key = file("~/.aws/test.pem")
        }
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt update -y"
            "sudo apt install ansible -y"
            "ansible-playbook test-playbook.yml"
        ]

        connection {
            type = "ssh"
            user = "ubuntu"
            private_key = file("~/.aws/test.pem")
        }
    }

}