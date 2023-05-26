terraform {
  required_version = "~> 1.4"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "my-bucket-remote-state"
    key    = "aws-vm-provisioners/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region              = var.region
  shared_config_files = ["~/.aws/credentials"]
  profile             = "terraform"


}


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-bucket-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}



