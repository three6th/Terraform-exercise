variable "aws_region" {
    description = "AWS region"
    type = string
    default = "eu-central-1"
}

variable "credentials" {
    description = "AWS credentials"
    type = string
    default = "~/.aws/credentials"
}