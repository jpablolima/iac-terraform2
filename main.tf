terraform {
  required_version = "~> 1.4"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
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
