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
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }


}

module "network" {
  source = "./network"

  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.1.0/24"
  environment = "development"
}