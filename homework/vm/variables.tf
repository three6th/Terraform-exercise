variable "aws_region" {
    description = "AWS region"
    type = string
    default = "eu-central-1"
}

variable "number_of_vms" {
    description = "Number of VM-s to create"
    type = number
    default = 1
}

variable "size_of_vms" {
    description = "Size for created VM's"
    type = string
    default = "t2.micro"
}

variable "list_of_ports" {
    description = "Ports to open"
    type = list(string)
    default = [
        "80",
        "443",
    ]
}