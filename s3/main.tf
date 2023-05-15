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
    key = "path/to/my/key"
    region = "us-east-1"    
  }

}

provider "aws" {
  region              = var.region
  shared_config_files = ["~/.aws/credentials"]
  profile             = "terraform"

  default_tags {
    
    tags = local.common_tags 
    
  }
}
