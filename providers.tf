terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Note: Create this S3 bucket manually in ap-south-1 once to store state
  backend "s3" {
    bucket = "my-statetf" 
    key    = "asg-project/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}