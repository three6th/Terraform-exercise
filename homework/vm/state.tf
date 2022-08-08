terraform {
    backend "s3"{
        region = var.aws_region
        bucket = "bsterraformbck"
        key = "terraform.tfstate"
        encrypt = "false"
        profile = "default"
    }
}