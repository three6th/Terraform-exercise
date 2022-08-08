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
    shared_credentials_file = var.credentials
    profile = "default"
}

resource "aws_s3_bucket" "terraformbcktest" {
    bucket = "bsterraformbck"
    acl = "private"

    tags = {
        Name = "terraformbcktest"
    }
}
