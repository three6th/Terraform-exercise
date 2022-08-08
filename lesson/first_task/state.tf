terraform {
    backend "s3"{
        region = "eu-central-1"
        shared_credentials_file = "~/.aws/credentials"
        bucket = "bsterraformbck"
        key = "terraform.tfstate"
        encrypt = "false"
        profile = "default"
    }
}